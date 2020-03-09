import 'package:flutter/material.dart';
import '../models/Product.dart';
import '../widgets/ProductItem.dart'; 
import '../widgets/appbar.dart'; 
import '../providers/ProductList.dart'; 
import 'dart:io'; 
import 'package:provider/provider.dart'; 
import 'package:firebase_database/firebase_database.dart';
import 'dart:async';

@override
class CollectionOverviewScreen extends StatefulWidget {
  CollectionOverviewScreen({this.userID});
  final String userID;

  @override
  _CollectionOverviewScreenState createState() => _CollectionOverviewScreenState();
}

class _CollectionOverviewScreenState extends State<CollectionOverviewScreen> {

  final FirebaseDatabase _database = FirebaseDatabase.instance;
  Query _userQuery;
  StreamSubscription<Event> _itemAddedSubscription;
  StreamSubscription<Event> _itemChangedSubscription;

  List<Product> _collectionList;

  final myController = TextEditingController();

  @override
  void initState() {
    _collectionList = new List();
    _userQuery = _database
      .reference()
      .child("collection")
      .orderByChild("userID")
      .equalTo(widget.userID);
    _itemAddedSubscription = _userQuery.onChildAdded.listen(onItemAdded);
    _itemChangedSubscription =_userQuery.onChildChanged.listen(onItemChanged);
  }

  onItemAdded(Event e) {
    setState(() {
      _collectionList.add(Product.fromSnapshot(e.snapshot));
    });
  }
  onItemChanged(Event e) {
    var itemBeforeChange = _collectionList.singleWhere((item) {
      return item.key == e.snapshot.key;
    });

    setState(() {
      _collectionList[_collectionList.indexOf(itemBeforeChange)] = Product.fromSnapshot(e.snapshot);
    });
}

@override
void dispose() {
  _itemAddedSubscription.cancel();
  _itemChangedSubscription.cancel();
  super.dispose();
}

_addItem(String name, String productType, String brand, String type, String finish, String imageURL) {
  if (name.length > 0) {
    Product product = new Product(
      name: name,
      productType: productType,
      brand: brand,
      type: type,
      finish: finish,
      imageURL: imageURL
    );
     _database.reference().child("collection").push().set(product.toJSON());
    print("Item added");
  }
}

_deleteItem(String itemID, int index) {
  _database.reference().child("collection").child(itemID).remove()
    .then((_) {
      setState(() {
        _collectionList.removeAt(index);
      });
      print("Item deleted");
    });
} 


  // final List<Product> _collectionList = [
  //   Product(
  //     name: 'Dried Apple Blossom',
  //     productType: 'Eyeshadow',
  //     brand: 'Rom&nd',
  //     type: 'Powder', //want these to only be certain things
  //     finish: 'Matte',
  //     imageURL: 'https://i.imgur.com/TbMWmwl.jpg',
  //   ),
  //   Product(
  //     name: 'Story, Metallic',
  //     productType: 'Eyeshadow',
  //     brand: 'Tati Beauty',
  //     type: 'Powder',
  //     finish: 'Metallic',
  //     imageURL: 'https://i.imgur.com/g0fSYAl.jpg',
  //   ),
  //   Product(
  //     name: 'Sugar Brownie',
  //     productType: 'Eyeshadow',
  //     brand: 'Dasique',
  //     type: 'Powder',
  //     finish: 'glitter',
  //     imageURL: 'https://i.imgur.com/ZYCzGtk.png',
  //   ),
  //   Product(
  //     name: 'Nude Peach',
  //     productType: 'Blush',
  //     brand: '3CE',
  //     type: 'Powder',
  //     finish: 'matte',
  //     imageURL: 'https://i.imgur.com/yVD7d0v.jpg',
  //   ),
  //   Product(
  //       name: 'Harusmire',
  //       productType: 'Blush',
  //       brand: 'Suqqu',
  //       type: 'Powder',
  //       finish: 'matte',
  //       imageURL: 'https://i.imgur.com/3VQrsWi.jpg')
  // ];

  File _pickedImage; 
  final _titleController = TextEditingController(); 
  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage; 
  }

  // void _saveProduct() {
  //   if (_titleController.text.isEmpty|| _pickedImage == null) 
  //     return; 
  //   Provider.of<ProductList>(context, listen: false).addProduct(_titleController.text, _pickedImage); 
  //   Navigator.of(context).pop(); 
  // }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBase(
        title:'My Collection'
    ),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: _collectionList.length,
          itemBuilder: (ctx, i) => ProductItem(name: _collectionList[i].name, finish: _collectionList[i].finish, imageURL: _collectionList[i].imageURL),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 0,
              mainAxisSpacing: 10),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Hi there");
            _addItem('Nude Peach', 'Blush', '3CE', 'Powder', 'matte', 'https://i.imgur.com/yVD7d0v.jpg');
          },
          tooltip: 'Increment',
          child: Icon(Icons.add)
        ),);
  }
}

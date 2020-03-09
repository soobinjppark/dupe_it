import 'package:flutter/material.dart';
import '../models/Product.dart';
import '../widgets/ProductItem.dart'; 
import '../widgets/appbar.dart'; 
import 'dart:io'; 
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

  final nameController = TextEditingController();
  final productTypeController = TextEditingController();
  final brandController = TextEditingController();
  final typeController = TextEditingController();
  final finishController = TextEditingController();
  final imageURLController = TextEditingController();

  void clearAll() {
    nameController.clear();
    productTypeController.clear();
    brandController.clear();
    typeController.clear();
    finishController.clear();
    imageURLController.clear();
  }

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
      userID: widget.userID,
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
  showDeletedDialog(BuildContext context, String itemID, int index) async {
    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: new Row(
            children: <Widget>[
              new Text("Delete the selected item?")
            ],
          ),
          actions: <Widget>[
            new FlatButton(
                  child: const Text('Yes'),
                  onPressed: () {
                    _deleteItem(itemID, index);
                    Navigator.pop(context);
                  }),
            new FlatButton(
                  child: const Text('No'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
          ],
        );
      }
    );
  }

  showCollectionDialog(BuildContext context) async {
    clearAll();
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: new Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Center(
                  child: new TextField(
                    controller: nameController,
                    autofocus: true,
                    decoration: new InputDecoration(
                      labelText: 'Name',
                    ),
                  )
                ),
                new Center(
                  child: new TextField(
                    controller: productTypeController,
                    autofocus: true,
                    decoration: new InputDecoration(
                      labelText: 'Product Type',
                    ),
                  )
                ),
                new Center(
                  child: new TextField(
                    controller: brandController,
                    autofocus: true,
                    decoration: new InputDecoration(
                      labelText: 'Brand',
                    ),
                  )
                ),
                new Center(
                  child: new TextField(
                    controller: typeController,
                    autofocus: true,
                    decoration: new InputDecoration(
                      labelText: 'Type',
                    ),
                  )
                ),
                new Center(
                  child: new TextField(
                    controller: finishController,
                    autofocus: true,
                    decoration: new InputDecoration(
                      labelText: 'Finish',
                    ),
                  )
                ),
                new Center(
                  child: new TextField(
                    controller: imageURLController,
                    autofocus: true,
                    decoration: new InputDecoration(
                      labelText: 'Image Link',
                    ),
                  )
                )
              ],
            ),
            actions: <Widget>[
              new FlatButton(
                  child: const Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              new FlatButton(
                  child: const Text('Save'),
                  onPressed: () {
                    _addItem(
                      nameController.text.toString(),
                      productTypeController.text.toString(),
                      brandController.text.toString(),
                      typeController.text.toString(),
                      finishController.text.toString(),
                      imageURLController.text.toString());
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBase(
        title:'My Collection'
    ),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: _collectionList.length,
          itemBuilder: (ctx, i) => ProductItem(name: _collectionList[i].name, finish: _collectionList[i].finish, imageURL: _collectionList[i].imageURL, index: i, deleteCallback: () => showDeletedDialog(context, _collectionList[i].key, i),),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 0,
              mainAxisSpacing: 10
            ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showCollectionDialog(context);
          },
          tooltip: 'Increment',
          child: Icon(Icons.add)
        ),);
  }
}

class SnackBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () {
          final snackBar = SnackBar(
            content: Text('Item deleted!'),
            action: SnackBarAction(
              label: 'Undo',
              onPressed: () {
                // Some code to undo the change.
              },
            ),
          );

          // Find the Scaffold in the widget tree and use
          // it to show a SnackBar.
          Scaffold.of(context).showSnackBar(snackBar);
        },
        child: Text('Show SnackBar'),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../models/Product.dart';
import '../widgets/ProductItem.dart'; 
import '../widgets/appbar.dart'; 
import '../providers/ProductList.dart'; 
import 'dart:io'; 
import 'package:provider/provider.dart'; 


@override
class CollectionOverviewScreen extends StatefulWidget {
  @override
  _CollectionOverviewScreenState createState() => _CollectionOverviewScreenState();
}

class _CollectionOverviewScreenState extends State<CollectionOverviewScreen> {
  final List<Product> sample = [
    Product(
      name: 'Dried Apple Blossom',
      productType: 'Eyeshadow',
      brand: 'Rom&nd',
      type: 'Powder', //want these to only be certain things
      finish: 'Matte',
      imageURL: 'https://i.imgur.com/TbMWmwl.jpg',
    ),
    Product(
      name: 'Story, Metallic',
      productType: 'Eyeshadow',
      brand: 'Tati Beauty',
      type: 'Powder',
      finish: 'Metallic',
      imageURL: 'https://i.imgur.com/g0fSYAl.jpg',
    ),
    Product(
      name: 'Sugar Brownie',
      productType: 'Eyeshadow',
      brand: 'Dasique',
      type: 'Powder',
      finish: 'glitter',
      imageURL: 'https://i.imgur.com/ZYCzGtk.png',
    ),
    Product(
      name: 'Nude Peach',
      productType: 'Blush',
      brand: '3CE',
      type: 'Powder',
      finish: 'matte',
      imageURL: 'https://i.imgur.com/yVD7d0v.jpg',
    ),
    Product(
        name: 'Harusmire',
        productType: 'Blush',
        brand: 'Suqqu',
        type: 'Powder',
        finish: 'matte',
        imageURL: 'https://i.imgur.com/3VQrsWi.jpg')
  ];
  File _pickedImage; 
  final _titleController = TextEditingController(); 
  void _selectImage(File pickedImage) {
    _pickedImage = pickedImage; 
  }

  void _saveProduct() {
    if (_titleController.text.isEmpty|| _pickedImage == null) 
      return; 
    Provider.of<ProductList>(context, listen: false).addProduct(_titleController.text, _pickedImage); 
    Navigator.of(context).pop(); 
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarBase(
        title:'My Collection'
    ),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: sample.length,
          itemBuilder: (ctx, i) => ProductItem(name: sample[i].name, finish: sample[i].finish, imageURL: sample[i].imageURL),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 0,
              mainAxisSpacing: 10),
        ));
  }
}

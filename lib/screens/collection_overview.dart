import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_item.dart'; 

class CollectionOverviewScreen extends StatelessWidget {
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('DupeIt')),
        body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: sample.length,
          itemBuilder: (ctx, i) => ProductItem(sample[i].name, sample[i].finish, sample[i].imageURL),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
        ));
  }
}

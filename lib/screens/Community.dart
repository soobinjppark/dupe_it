import 'package:flutter/material.dart';
import '../widgets/DupeItem.dart';
import '../models/dupe.dart';
import '../models/Product.dart';
import '../widgets/appbar.dart';
import '../widgets/ProductItem.dart';

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  final List<Dupe> sample = [
    Dupe(
      productComp: Product(
        name: 'Place Holder', 
        productType: 'Lipstick',
        brand: 'Gucci',
        type: 'Bullet', 
        finish: 'Satin', 
        imageURL: 'https://i.imgur.com/yVD7d0v.jpg',
      ), 
      productItem: Product(
        name: 'Holder Place', 
        productType: 'Lipstick', 
        brand: 'MAC', 
        type: 'Bullet', 
        finish: 'Satin', 
        imageURL: 'https://i.imgur.com/yVD7d0v.jpg'
      ),
      percent: 85  
    ), 
  ]; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBase(
        title: 'Community'
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        scrollDirection: Axis.vertical,
        itemCount: sample.length,
        itemBuilder: (context, index) => DupeItem(myProduct: ProductItem(name: sample[index].productComp.name, finish: sample[index].productComp.finish, imageURL: sample[index].productComp.imageURL), 
                                                  dupeProduct: ProductItem(name: sample[index].productItem.name, finish: sample[index].productItem.finish, imageURL: sample[index].productItem.imageURL)),
      )
    );
  }
}
  
import 'package:dupe_it/widgets/appbar.dart';
import 'package:flutter/material.dart';
import '../models/Dupe.dart'; 
import '../models/Product.dart'; 
import '../widgets/DupeItem.dart';
import '../widgets/ProductItem.dart';

class Loves extends StatelessWidget {

  final List<Dupe> sample = [
    Dupe(
      productComp: Product(
        name: 'Goldie Red', 
        productType: 'Lipstick',
        brand: 'Gucci',
        type: 'Bullet', 
        finish: 'Satin', 
        imageURL: 'https://i.imgur.com/tfwEIQW.jpg',
      ), 
      productItem: Product(
        name: 'Mangrove', 
        productType: 'Lipstick', 
        brand: 'MAC', 
        type: 'Bullet', 
        finish: 'Satin', 
        imageURL: 'https://i.imgur.com/AmBdIDH.png'
      ),
      percent: 85  
    )
  ]; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBase(
        title: 'Loved Dupes'
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        scrollDirection: Axis.vertical,
        itemCount: sample.length,
        itemBuilder: (context, index) => DupeItem(myProduct: ProductItem(name: sample[index].productComp.name, finish: sample[index].productComp.finish, imageURL: sample[index].productComp.imageURL), 
                                                  dupeProduct: ProductItem(name: sample[index].productItem.name, finish: sample[index].productItem.finish, imageURL: sample[index].productItem.imageURL)),
      )
    );
  }
}
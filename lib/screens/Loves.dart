import 'package:dupe_it/widgets/appbar.dart';
import 'package:flutter/material.dart';
import '../models/Dupe.dart'; 
import '../models/Product.dart'; 
import '../widgets/DupeItem.dart';

class Loves extends StatelessWidget {

  final List<Dupe> sample = [
    Dupe(
      productComp: Product(
        name: 'Goldie Red', 
        productType: 'Lipstick',
        brand: 'Gucci',
        type: 'Bullet', 
        finish: 'Satin', 
        imageURL: 'https://imgur.com/a/H8Q044L',
      ), 
      productItem: Product(
        name: 'Mangrove', 
        productType: 'Lipstick', 
        brand: 'MAC', 
        type: 'Bullet', 
        finish: 'Satin', 
        imageURL: 'https://imgur.com/a/EFNpzjT'
      ),
      percent: 85  
    ), 
  ]; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarBase(
        title: 'Loved Dupes'
      ),
      body: GridView.builder(
        itemCount: sample.length,
        itemBuilder: (context, index) => new DupeItem(sample[index].productComp, sample[index].productItem),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10
        ),
      )
    );
  }
}





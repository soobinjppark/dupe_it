import 'package:flutter/material.dart';
import '../models/dupe.dart'; 
import '../models/product.dart'; 
import '../widgets/appbar.dart';
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
      padding: const EdgeInsets.all(10),
      itemCount: sample.length, 
      
    )

    
    
    );
  }
}





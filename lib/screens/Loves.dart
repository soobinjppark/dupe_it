import 'package:flutter/material.dart';
import '../models/dupe.dart'; 
import '../models/product.dart'; 


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

  }
}





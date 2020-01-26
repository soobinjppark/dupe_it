import 'package:flutter/material.dart';


class ProductItem extends StatelessWidget {
   final String name; 
    final String finish; 
    final String imageURL; 

    ProductItem(this.name, this.finish, this.imageURL); 
  @override
  Widget build(BuildContext context) {
  
    return GridTile(
      child: Image.network(imageURL,  fit: BoxFit.cover),
      footer: GridTileBar(title: Text(name, textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold))), 
    );
  }
}
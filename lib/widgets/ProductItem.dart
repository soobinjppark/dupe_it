import 'package:flutter/material.dart';


class ProductItem extends StatelessWidget {
  final String name; 
  final String finish; 
  final String imageURL; 

  ProductItem({this.name, this.finish, this.imageURL}); 

  @override
  Widget build(BuildContext context) {
  
    return Container(
      height: 100, 
      width: 50, 
      
      child: Card(
      semanticContainer: true,
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Image.network(
        imageURL, fit: BoxFit.fill
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 5,
      margin: EdgeInsets.all(10) 
    )
    ); 
    // return GridTile(
    //   child: Image.network(imageURL,  fit: BoxFit.cover),
    //   footer: GridTileBar(title: Text(name, textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold))), 
    // );
  }
}
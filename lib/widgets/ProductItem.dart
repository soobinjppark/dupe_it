import 'package:flutter/material.dart';
import '../screens/CameraDupe.dart';
class ProductItem extends StatelessWidget {
  final String name; 
  final String finish; 
  final String imageURL; 

  ProductItem({this.name, this.finish, this.imageURL}); 

  @override
  Widget build(BuildContext context) {
  
    return Container(
      height: 250, 
      width: 150, 
      
      child: Card(
        semanticContainer: true,
        child: Container(
          decoration: BoxDecoration(
            image: new DecorationImage(
              image: new NetworkImage(imageURL),
              fit: BoxFit.fill,
              alignment: Alignment.bottomLeft
            ),
            borderRadius: new BorderRadius.circular(20.0)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              SizedBox(height: 180),
              Text("  " + name, textAlign: TextAlign.left, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14.0)),
              Text("  " + finish, textAlign: TextAlign.left, style: TextStyle(color: Colors.white, fontSize: 13.0)),
            ]
          ), 
        ),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(20.0)
        ),
        elevation: 5,
        margin: EdgeInsets.all(10) 
      ),
      
    ); 
  }
}
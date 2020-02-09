import 'package:flutter/material.dart';
import './ProductItem.dart';
import '../models/Product.dart';

class DupeItem extends StatelessWidget {
  @override
  final ProductItem myProduct;
  final ProductItem dupeProduct;

  DupeItem({this.myProduct, this.dupeProduct});

  Widget build(BuildContext context) {
    final List<ProductItem> output = [myProduct, dupeProduct]; 
    return (
        new Container(
          height: 300,
          width: 300,
          child: IntrinsicHeight(
            child: IntrinsicWidth(
              child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new ProductItem(name: myProduct.name, finish: myProduct.finish, imageURL: myProduct.imageURL), 
                Center(child: Text("vs")),
                new ProductItem(name: myProduct.name, finish: myProduct.finish, imageURL: dupeProduct.imageURL)
              ],
            )
            )
          )
        )
    );
  }
}
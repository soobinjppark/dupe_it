import 'package:flutter/material.dart';
import './ProductItem.dart';
import '../models/Product.dart';

class DupeItem extends StatelessWidget {
  @override
  ProductItem myProduct;
  ProductItem dupeProduct;

  DupeItem(Product mProduct, Product dProduct) {
    myProduct = new ProductItem(name: mProduct.name, finish: mProduct.finish, imageURL: mProduct.imageURL);
    dupeProduct = new ProductItem(name: dProduct.name, finish: dProduct.finish, imageURL: dProduct.imageURL);
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        child: new Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              child: dupeProduct,
              height: 500
            ),
            Text("vs."),
            Container(
              child: dupeProduct,
              height: 500
            )
          ],
        )
      )
    );
  }
}
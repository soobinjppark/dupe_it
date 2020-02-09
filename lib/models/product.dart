import 'package:flutter/foundation.dart';

class Product {
  final String name;
  final String productType;
  final String brand;
  final String type;
  final String finish;
  final String imageURL;

  Product(
      {@required this.name,
      @required this.productType,
      this.brand,
      @required this.type,
      @required this.finish,
      @required this.imageURL});
}

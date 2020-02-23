import 'package:flutter/foundation.dart';
import 'dart:io'; 
class Product {
  final String name;
  final String productType;
  final String brand;
  final String type;
  final String finish;
  final String imageURL;
  final File imageFile; 

  Product(
      {@required this.name,
      @required this.productType,
      this.brand,
      @required this.type,
      @required this.finish,
      this.imageURL, 
      this.imageFile,});
}

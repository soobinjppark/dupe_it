import 'package:flutter/foundation.dart';
import 'dart:io'; 
import 'package:firebase_database/firebase_database.dart';

class Product {
  String key;
  String userID;
  String name;
  String productType;
  String brand;
  String type;
  String finish;
  String imageURL;
  File imageFile; 

  Product({
      @required this.userID,
      @required this.name,
      @required this.productType,
      this.brand,
      @required this.type,
      @required this.finish,
      this.imageURL, 
      //this.imageFile
  });

  Product.fromSnapshot(DataSnapshot snapshot) :
    key = snapshot.key,
    userID = snapshot.value["userID"],
    name = snapshot.value["name"],
    productType = snapshot.value["productType"],
    brand = snapshot.value["brand"],
    type = snapshot.value["type"],
    finish = snapshot.value["finish"],
    imageURL = snapshot.value["imageURL"];
    //imageFile = snapshot.value["imageFile"];

  toJSON() {
    return {
      "userID": userID,
      "name": name,
      "productType": productType,
      "brand": brand,
      "type": type,
      "finish": finish,
      "imageURL": imageURL
      //"imageFile": imageFile
    };
  }

  
    
}

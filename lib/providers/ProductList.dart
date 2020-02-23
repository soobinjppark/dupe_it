import 'package:flutter/foundation.dart'; 
import 'dart:io'; 
import '../models/product.dart'; 


class ProductList with ChangeNotifier {
  List<Product> _collection = [Product(
      name: 'Dried Apple Blossom',
      productType: 'Eyeshadow',
      brand: 'Rom&nd',
      type: 'Powder', //want these to only be certain things
      finish: 'Matte',
      imageURL: 'https://i.imgur.com/TbMWmwl.jpg',
    ),
    Product(
      name: 'Story, Metallic',
      productType: 'Eyeshadow',
      brand: 'Tati Beauty',
      type: 'Powder',
      finish: 'Metallic',
      imageURL: 'https://i.imgur.com/g0fSYAl.jpg',
    ),
    Product(
      name: 'Sugar Brownie',
      productType: 'Eyeshadow',
      brand: 'Dasique',
      type: 'Powder',
      finish: 'glitter',
      imageURL: 'https://i.imgur.com/ZYCzGtk.png',
    ),
    Product(
      name: 'Nude Peach',
      productType: 'Blush',
      brand: '3CE',
      type: 'Powder',
      finish: 'matte',
      imageURL: 'https://i.imgur.com/yVD7d0v.jpg',
    ),
    Product(
        name: 'Harusmire',
        productType: 'Blush',
        brand: 'Suqqu',
        type: 'Powder',
        finish: 'matte',
        imageURL: 'https://i.imgur.com/3VQrsWi.jpg')
  ]; 

  List<Product> get collection {
    return [... _collection];}

  void addProduct(String title, File image) {
    final newProduct =  Product(name:title, finish: null, brand: null, type: null, productType: null, imageFile: image); 
    _collection.add(newProduct); 
    notifyListeners(); 
  }


}
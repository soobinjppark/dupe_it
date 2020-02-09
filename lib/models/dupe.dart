import 'package:flutter/foundation.dart';
import './product.dart';

class Dupe {
  final Product productComp;
  final Product productItem;
  final int percent; 
  
  Dupe({@required this.productComp, @required this.productItem, this.percent});
}

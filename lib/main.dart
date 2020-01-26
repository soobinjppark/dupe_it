import 'package:flutter/material.dart';
import './screens/login.dart';
import './screens/home.dart';
import './screens/collection_overview.dart'; 

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DupeIt',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(),
    );
  }
}
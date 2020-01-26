import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'login.dart';
=======
import './screens/collection_overview.dart'; 
>>>>>>> d9e4740d50754247fa500a5ff3444648ba5244ed

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
<<<<<<< HEAD

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DupeIt',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Login(),
=======
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CollectionOverviewScreen(),
>>>>>>> d9e4740d50754247fa500a5ff3444648ba5244ed
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dupe It'),
      ),
      body: Center(
        child: Text('Default Collection Screen'),
      ),
    );
  }
}

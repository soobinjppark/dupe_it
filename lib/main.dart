import 'package:flutter/material.dart';
import 'package:dupe_it/services/Auth.dart';
import 'package:dupe_it/screens/RootPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DupeIt',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: RootPage(auth: new Auth()),
    );
  }
}
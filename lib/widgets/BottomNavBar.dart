import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/CollectionOverviewScreen.dart';
import '../screens/Loves.dart';
import '../screens/Community.dart';
import '../screens/Camera.dart'; 

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    CollectionOverviewScreen(),
    Loves(),
    Camera(),
    Community(),
    CollectionOverviewScreen()
  ];

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: _children[_currentIndex]
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTapped,
        selectedItemColor: Colors.amber[800],
        currentIndex: _currentIndex,
        unselectedIconTheme: new IconThemeData(
          color: Colors.black,
          opacity: 0.8
        ),
        selectedIconTheme: new IconThemeData(
          color: Colors.amber[800],
          opacity: 0.8
        ),
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.collections),
            title: new Text(""),
          ),
          BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.heart),
            title: new Text(""),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.camera_alt),
            title: new Text(""),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.people),
            title: new Text(""),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.settings),
            title: new Text(""),
          ),
        ]
      ),
      
    );
  }
}
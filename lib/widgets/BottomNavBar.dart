import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/CollectionOverviewScreen.dart';
import '../screens/Loves.dart';
import '../screens/Community.dart';
import '../screens/CameraDupe.dart'; 
import '../screens/PaletteGenerator.dart'; 
import 'package:dupe_it/screens/Settings.dart';
import 'package:dupe_it/services/Auth.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({this.auth, this.logoutCallback, this.userID});
  final Auth auth;
  final VoidCallback logoutCallback;
  final String userID;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  
  int _currentIndex = 0;
  List<Widget> _children() => [
    CollectionOverviewScreen(userID: widget.userID),
    Loves(),
    MyApp(), 
    Community(),
    Settings(logoutCallback: widget.logoutCallback)
  ];

  void onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> children = _children();
    return new Scaffold(
      body: Center(
        child: children[_currentIndex]
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
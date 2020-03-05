import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../screens/CollectionOverviewScreen.dart';
import '../screens/Loves.dart';
import '../screens/Community.dart';
import '../screens/CameraDupe.dart'; 
<<<<<<< HEAD
import '../screens/PaletteGenerator.dart'; 
=======
import 'package:dupe_it/screens/Settings.dart';
import 'package:dupe_it/services/Auth.dart';

>>>>>>> 3c1476d19f772190da4847a92e13dca0a99efde3
class BottomNavBar extends StatefulWidget {
  BottomNavBar({this.auth, this.logoutCallback});
  final Auth auth;
  final VoidCallback logoutCallback;

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  
  int _currentIndex = 0;
  List<Widget> _children() => [
    CollectionOverviewScreen(),
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
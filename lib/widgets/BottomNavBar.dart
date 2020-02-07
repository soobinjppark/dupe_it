import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.collections),
            title: new Text("Collection")
          ),
          BottomNavigationBarItem(
            icon: new Icon(FontAwesomeIcons.heart),
            title: new Text("Heart")
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.camera_alt),
            title: new Text("Camera")
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.people),
            title: new Text("Community")
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.settings),
            title: new Text("Settings")
          ),
        ]
      ),
      
    );
  }
}
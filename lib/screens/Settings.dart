import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  Settings({this.logoutCallback});
  final VoidCallback logoutCallback;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void logOut() {
    widget.logoutCallback();
    print('Signed out');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding (
                padding: const EdgeInsets.all(20),
                child: new OutlineButton(
                  child: new Text('Logout'),
                  onPressed: () => logOut(),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.orange),
                  textColor: Colors.orange,
                ),
              ),
            ]
          )
        ),
      );
  }
}
import 'package:dupe_it/screens/CollectionOverviewScreen.dart';
import 'package:dupe_it/screens/MyHomePage.dart';
import 'package:dupe_it/services/Auth.dart';
import 'package:dupe_it/widgets/BottomNavBar.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  NULL,
  LOGGED_OUT,
  LOGGED_IN
}

class RootPage extends StatefulWidget {
  RootPage({this.auth});
  final Auth auth;

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {

  AuthStatus authStatus = AuthStatus.NULL;
  String _userID = "";

  void initState() {
    super.initState();
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        if (user != null) {
          _userID = user?.uid;
        }
        authStatus = user?.uid == null ? AuthStatus.LOGGED_OUT : AuthStatus.LOGGED_IN;
      });
    });
  }

  void loginCallback() {
    widget.auth.getCurrentUser().then((user) {
      setState(() {
        _userID = user.uid.toString();
      });
    });
    setState(() {
      authStatus = AuthStatus.LOGGED_IN;
    });
  }

  void logoutCallback() {
    setState(() {
      authStatus = AuthStatus.LOGGED_OUT;
      _userID = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.NULL:
        return Text('TODO WAITING');
        break;
      case AuthStatus.LOGGED_OUT:
        return new MyHomePage(
          auth: widget.auth,
          loginCallback: loginCallback,
        );
        break;
      case AuthStatus.LOGGED_IN:
        if (_userID != null) {
          return BottomNavBar(
            auth: widget.auth,
            logoutCallback: logoutCallback,
          );
        }
        break;
    }
  }
}
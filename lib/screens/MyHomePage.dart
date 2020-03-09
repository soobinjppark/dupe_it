import 'package:flutter/material.dart';
import './Login.dart';
import './Signup.dart';
import '../widgets/appbar.dart'; 
import 'package:dupe_it/services/Auth.dart';
import 'package:firebase_database/firebase_database.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({this.auth, this.loginCallback});

  final Auth auth;
  final VoidCallback loginCallback;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void toSignUp(context) => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignUp(auth: widget.auth, loginCallback: widget.loginCallback )));
  void toLogin(context) => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Login(auth: widget.auth, loginCallback: widget.loginCallback)));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DupeIt',
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: Scaffold(
        appBar: appBarBase(
          title:'DupeIt',
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding (
                padding: const EdgeInsets.all(20),
                child: new OutlineButton(
                  child: new Text('Sign Up'),
                  onPressed: () => toSignUp(context),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.orange),
                  textColor: Colors.orange,
                ),
              ),
              Padding (
                padding: const EdgeInsets.all(20),
                child: new OutlineButton(
                  child: new Text('Log In'),
                  onPressed: () => toLogin(context),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.orange),
                  textColor: Colors.orange,
                ),
              ),
            ]
          )
        ),
      )

    );
  }
}

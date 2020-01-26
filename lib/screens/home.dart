import 'package:flutter/material.dart';
import './login.dart';
import './signup.dart';

class MyHomePage extends StatelessWidget {
  void toSignUp(context) => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignUp()));
  void toLogin(context) => Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => Login()));


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DupeIt',
      theme: ThemeData(
        primarySwatch: Colors.orange
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('DupeIt'),
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

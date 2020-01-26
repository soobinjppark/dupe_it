import 'package:flutter/material.dart';

class Login extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _LoginState();
}

void loginButton() => print('Hello');

class _LoginState extends State<Login> {
  String _email;
  String _password;

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('DupeIt'),  
      ),
      body: new Container(
        padding: EdgeInsets.all(30.0),
        child: new Form(
          child: new Column(
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(
                  icon: const Icon(Icons.email),
                  labelText: 'Email'
                ),
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  icon: const Icon(Icons.lock),
                  labelText: 'Password'
                )
              ),
              new RaisedButton(
                child: new Text('Login'),
                onPressed: loginButton,
              ),
            ]
          )
        )
      )
    );
  }
}
import 'package:flutter/material.dart';
import './CollectionOverviewScreen.dart';
import '../widgets/appbar.dart'; 
import '../widgets/BottomNavBar.dart';

class SignUp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _username;
  String _email;
  String _password;
  String _passwordCheck;
  bool _obscureText = true;

  final formKey = new GlobalKey<FormState>();

  void validateSignUp(BuildContext context) {
    final form = formKey.currentState;
    form.save();
    if (form.validate()) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => BottomNavBar()));
    }
  }

  String validEmail(String value) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    return !emailValid ? 'Please enter a valid email' : null;
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBarBase(
        title:'Sign Up'
    ),
      body: new Container(
        padding: EdgeInsets.all(30.0),
        child: new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(
                  icon: const Icon(Icons.person),
                  labelText: 'Username'
                ),
                validator: (value) => value.isEmpty ? 'Please enter your username' : null,
                onSaved: (value) => _username = value,
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  icon: const Icon(Icons.email),
                  labelText: 'Email',
                ),
                validator: (value) => validEmail(value),
                onSaved: (value) => _email = value,
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  icon: const Icon(Icons.lock),
                  labelText: 'Password'
                ),
                validator: (value) => value.isEmpty ? 'Please enter your password' : null,
                onSaved: (value) => _password = value,
                obscureText: _obscureText,
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  icon: const Icon(Icons.lock),
                  labelText: 'Enter your password again'
                ),
                validator: (value) => value.isEmpty ? 'Please enter your password' : null,
                onSaved: (value) => _passwordCheck = value,
                obscureText: _obscureText,
              ),
              Padding (
                padding: const EdgeInsets.all(20),
                child: new OutlineButton(
                  child: new Text('Sign Up'),
                  onPressed: () => validateSignUp(context),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(20.0)),
                  borderSide: BorderSide(color: Colors.orange),
                  textColor: Colors.orange,
                ),
              ),
            ]
          )
        )
      )
    );
  }
}
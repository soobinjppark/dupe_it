import 'package:flutter/material.dart';
import './CollectionOverviewScreen.dart';
import '../widgets/appbar.dart';
import '../widgets/BottomNavBar.dart';
import 'package:dbcrypt/dbcrypt.dart';
import '../services/Auth.dart';

class Login extends StatefulWidget {
  Login({this.auth});
  final Auth auth;
  
  @override
  State<StatefulWidget> createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _password;
  final formKey = new GlobalKey<FormState>();

  void validateLogin(BuildContext context) {
    final form = formKey.currentState;
    form.save();
    if (form.validate()) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => BottomNavBar()));
    }
  } 

  bool checkPassword(String value) {
    return new DBCrypt().checkpw(value, 'TODO');
  }

  String validEmail(String value) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    return !emailValid ? 'Please enter a valid email' : null;
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBarBase(
        title:'Login'
    ),
      // appBar: new AppBar(
      //   title: new Text('DupeIt', style: TextStyle(color: Colors.white)),  
      // ),
      body: new Container(
        padding: EdgeInsets.all(30.0),
        child: new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(
                  icon: const Icon(Icons.email),
                  labelText: 'Email',
                ),
                validator: (value) => validEmail(value),
                onSaved: (value) => _email = value.trim(),
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  icon: const Icon(Icons.lock),
                  labelText: 'Password'
                ),
                validator: (value) => value.isEmpty ? 'Please enter your password' : null,
                onSaved: (value) => _password = value.trim(),
              ),
              Padding (
                padding: const EdgeInsets.all(20),
                child: new OutlineButton(
                  child: new Text('Login'),
                  onPressed: () => validateLogin(context),
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
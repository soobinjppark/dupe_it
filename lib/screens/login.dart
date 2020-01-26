import 'package:flutter/material.dart';
import './collection_overview.dart';

class Login extends StatefulWidget {

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
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => CollectionOverviewScreen()));
    }
  } 

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('DupeIt', style: TextStyle(color: Colors.white)),  
      ),
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
                validator: (value) => value.isEmpty ? 'Please enter your email' : null,
                onSaved: (value) => _email = value,
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  icon: const Icon(Icons.lock),
                  labelText: 'Password'
                ),
                validator: (value) => value.isEmpty ? 'Please enter your password' : null,
                onSaved: (value) => _password = value,
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
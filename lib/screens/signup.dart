import 'package:flutter/material.dart';
import '../widgets/appbar.dart'; 
import '../widgets/BottomNavBar.dart';
import '../services/Auth.dart';

class SignUp extends StatefulWidget {
  SignUp({this.auth, this.loginCallback});
  final Auth auth;
  final VoidCallback loginCallback;
  
  @override
  State<StatefulWidget> createState() => new _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _username;
  String _email;
  String _password;
  String _passwordCheck;
  String _errorMessage;
  bool _obscureText = true;

  @override
  void initState() {
    _errorMessage = "";
    super.initState();
  }

  final formKey = new GlobalKey<FormState>();

  bool validateSignUp() {
    final form = formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validateAndSubmit() async {
    if (validateSignUp()) {
      String userID = "";
      try {
          userID = await widget.auth.signUp(_username, _email, _password);
          print('Signed up: $userID');
          if (userID != null) {
            widget.loginCallback();
            Navigator.pop(context);
          }
      } catch (e) {
        print(e.message);
        setState(() {
          _errorMessage = e.message;
        });
        _showDialog();
      }
    }
  }


  String validEmail(String value) {
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value);
    return !emailValid ? 'Please enter a valid email' : null;
  }

    void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Signup Failed"),
          content: new Text(_errorMessage),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
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
                onSaved: (value) => _username = value.trim(),
              ),
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
                  onPressed: () => validateAndSubmit(),
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
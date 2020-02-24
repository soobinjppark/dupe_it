import 'package:flutter/material.dart';
import '../widgets/appbar.dart';
import '../widgets/BottomNavBar.dart';
import '../services/Auth.dart';

class Login extends StatefulWidget {
  Login({this.auth, this.loginCallback});
  final Auth auth;
  final VoidCallback loginCallback;

  @override
  State<StatefulWidget> createState() => new _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _password;
  String _errorMessage;
  final _formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    _errorMessage = "";
    super.initState();
  }

  bool validateLogin() {
    final form = _formKey.currentState;
    if (form.validate()) {
        form.save();
        return true;
    }
    return false;
  } 

  void validateAndSubmit() async {
    if (validateLogin()) {
      String userID = "";
      try {
          userID = await widget.auth.signIn(_email, _password);
          print('Signed in: $userID');

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
          title: new Text("Login Failed"),
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
        title:'Login'
    ),
      // appBar: new AppBar(
      //   title: new Text('DupeIt', style: TextStyle(color: Colors.white)),  
      // ),
      body: new Container(
        padding: EdgeInsets.all(30.0),
        child: new Form(
          key: _formKey,
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
                obscureText: true,
              ),
              Padding (
                padding: const EdgeInsets.all(20),
                child: new OutlineButton(
                  child: new Text('Login'),
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
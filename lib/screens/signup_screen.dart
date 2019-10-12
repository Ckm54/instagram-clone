import 'dart:core';

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {

  static final String id = 'signup_screen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final _formKey = GlobalKey<FormState>();
  String _name, _email, _password;

  _submit() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      print(_name);
      print(_email);
      print(_password);
      // TODO: Attempt to login the user with firebase
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            'Instagram',
            style: TextStyle(fontFamily: 'Billabong', fontSize: 50.0),
            ),
            Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                   Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0,
                    ),
                    child: TextFormField(decoration: InputDecoration(labelText: 'Name'),
                    validator: (input) => input.trim().isEmpty 
                    ? 'Name cannot be left blank' 
                    : null,
                    onSaved: (input) => _name = input,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0,
                    ),
                    child: TextFormField(decoration: InputDecoration(labelText: 'Email'),
                    validator: (input) => !input.contains('@') ? 'Please enter a valid email' : null,
                    onSaved: (input) => _email = input,
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.0,
                      vertical: 10.0,
                    ),
                    child: TextFormField(decoration: InputDecoration(labelText: 'Password'),
                    validator: (input) => input.length < 6
                    ? 'Must be at least 6 characters' 
                    : null,
                    onSaved: (input) => _password = input,
                    obscureText: true,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Container(
                    width: 250.0,
                    child: FlatButton(
                      onPressed: _submit,
                      color: Colors.blue,
                      padding: EdgeInsets.all(10.0),
                      child: Text('SignUp', style: TextStyle(color: Colors.white, fontSize:18.0)),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(
                    width: 250.0,
                    child: FlatButton(
                      onPressed: () => Navigator.pop(context),
                      color: Colors.blue,
                      padding: EdgeInsets.all(10.0),
                      child: Text('Back to Login', style: TextStyle(color: Colors.white, fontSize:18.0)),
                    ),
                  )
                ],
              ),
          ),
        ]
        ),
      ),
    );
  }
}
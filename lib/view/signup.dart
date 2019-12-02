import 'package:device_tracker/model/user_model.dart';
import 'package:flutter/material.dart';

import '../service/http.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;
  String _email;
  String _password;
  String _confirm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Column(
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, fontSize: 40.0),
                      ),
                      SizedBox(height: 50.0),
                      Form(
                          key: _formKey,
                          autovalidate: _autoValidate,
                          child: formUI()),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget formUI() {
    return Container(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 64.0),
      child: Column(
        children: <Widget>[
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
            decoration: InputDecoration(labelText: 'EMail'),
            validator: validateEMail,
            onSaved: (String val) {
              _email = val;
            },
          ),
          TextFormField(
            style: TextStyle(color: Colors.white, fontSize: 20.0),
            obscureText: true,
            decoration: InputDecoration(labelText: 'Password'),
            validator: validatePassword,
            onSaved: (String val) {
              _password = val;
            },
          ),
          TextFormField(
            style: TextStyle(color: Colors.white, fontSize: 20.0),
            obscureText: true,
            decoration: InputDecoration(labelText: 'Confirm Password'),
            validator: validateConfirm,
            onSaved: (String val) {
              _confirm = val;
            },
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32.0, top: 64.0),
            child: MaterialButton(
              onPressed: () {
                _validateInputs();
              },
              textColor: Colors.lightBlue,
              color: Colors.white,
              child: Text('Submit'),
              splashColor: Colors.lightBlue,
              shape: StadiumBorder(),
              minWidth: double.infinity,
            ),
          )
        ],
      ),
    );
  }

  String validateEMail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.length < 6)
      return 'Password should be atleast 6 characters';
    else
      return null;
  }

  String validateConfirm(String value) {
    if(value.length < 6 && value != _password) 
      return 'Password not matching';
    else 
      return null;
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      //post user data here get to know how to create json 
      postUser();

    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}

import 'package:flutter/material.dart';

import './view/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Device Tracker',
      theme: ThemeData(primaryColor: Colors.white, fontFamily: 'BalooBhai'),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
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
                      Icon(Icons.devices, color: Colors.white, size: 50.0),
                      SizedBox(
                        height: 35.0,
                      ),
                      Text(
                        'Welcome',
                        style: TextStyle(color: Colors.white, fontSize: 40.0),
                      ),
                      SizedBox(height: 50.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()));
                          },
                          textColor: Colors.lightBlue,
                          color: Colors.white,
                          child: Text('Login'),
                          splashColor: Colors.lightBlue,
                          shape: StadiumBorder(),
                          minWidth: double.infinity,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}

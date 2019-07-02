import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class Authen extends StatefulWidget {
  @override
  _AuthenState createState() => _AuthenState();
}

class _AuthenState extends State<Authen> {
//Explict
  double mySize = 250.0;

//Medthod
  Widget mySizeBox() {
    return SizedBox(
      width: 8.0,
    );
  }

  Widget signUpButton() {
    return RaisedButton(
      color: Colors.orange[400],
      child: Text(
        'Sign Up',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget signInButton() {
    return RaisedButton(
      color: Colors.orange[400],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget myButton() {
    return Container(
      width: 220.0,
      child: Row(
        children: <Widget>[
          Expanded(
            child: signInButton(),
          ),
          mySizeBox(),
          Expanded(
            child: signUpButton(),
          ),
        ],
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 220.0,
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Password',
          hintText: 'More 6 Charactor',
        ),
      ),
    );
  }

  Widget emailText() {
    return Container(
      width: 220.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          labelText: 'Email :',
          hintText: 'you@email.com',
        ),
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: mySize,
      height: mySize,
      child: Image.asset(
        'images/logo.png',
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showText() {
    return Text(
      'POP',
      style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.orange[700],
          fontFamily: 'Inconsolata'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.white, Colors.pink[100]],
          begin: Alignment.topCenter,
        )),
        padding: EdgeInsets.only(top: 60.0),
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            showLogo(),
            showText(),
            emailText(),
            passwordText(),
            myButton(),
          ],
        ),
      ),
    );
  }
}

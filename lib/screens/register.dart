import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
// Medthod
  Widget nameText() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'name',
        labelStyle: TextStyle(color: Colors.pink[300]),
        helperText: 'show Display Name',
        helperStyle: TextStyle(color: Colors.pink[300]),
        icon: Icon(
          Icons.face,
          size: 36.0,
          color: Colors.pink[300],
        ),
      ),
    );
  }

  Widget emailText() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.yellow[800]),
        helperText: 'Type you@email.com',
        helperStyle: TextStyle(color: Colors.yellow[800]),
        icon: Icon(
          Icons.email,
          size: 36.0,
          color: Colors.yellow[800],
        ),
      ),
    );
  }

  Widget passwordText() {
    return TextField(
      decoration: InputDecoration(
        labelText: 'password',
        labelStyle: TextStyle(color: Colors.blue[300]),
        helperText: 'more 6 charactor',
        helperStyle: TextStyle(color: Colors.blue[300]),
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: Colors.blue[300],
        ),
      ),
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Register'),
        actions: <Widget>[uploadButton()],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/pp.jpg'), fit: BoxFit.cover),
        ),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 60.0),
        child: Container(
          width: 250.0,
          child: Column(
            children: <Widget>[nameText(), emailText(), passwordText()],
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

class Myservice extends StatefulWidget {
  @override
  _MyserviceState createState() => _MyserviceState();
}

class _MyserviceState extends State<Myservice> {
// Explicit

// medthod

  Widget headMenu() {
    return DrawerHeader(
      decoration: BoxDecoration(),
      child: Column(
        children: <Widget>[
          Container(
            width: 60.0,
            height: 60.0,
            child: Image.asset('images/logo.png'),
          ),
          Text(
            'So ssru',
            style: TextStyle(
              color: Colors.orange[800],
              fontSize: 24.0,
            ),
          ),Text('Login by ...')
        ],
      ),
    );
  }

  Widget showDrewerMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[headMenu()],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My service'),
      ),
      body: Text('body'),
      drawer: showDrewerMenu(),
    );
  }
}

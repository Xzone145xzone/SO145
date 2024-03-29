import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ung_so145/main.dart';
import 'package:ung_so145/screens/my_map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ung_so145/screens/show_info.dart';
import 'package:ung_so145/screens/show_product.dart';

class Myservice extends StatefulWidget {
  @override
  _MyserviceState createState() => _MyserviceState();
}

class _MyserviceState extends State<Myservice> {
// Explicit
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String nameString = '';
  Widget myWidget = ShowProduct();

// medthod

  Widget myDivder() {
    return Divider(
      color: Colors.pink,
      height: 16.0,
    );
  }

  Widget menuInfo() {
    return ListTile(
      leading: Icon(
        Icons.info,
        color: Colors.purple,
        size: 36.0,
      ),
      title: Text(
        'Show Info',
        style: TextStyle(fontSize: 18.0),
      ),onTap: (){
        setState(() {
         myWidget = ShowInfo();
         Navigator.of(context).pop(); 
        });
      },
    );
  }

  Widget menuShowMap() {
    return ListTile(
      leading: Icon(
        Icons.map,
        color: Colors.green,
        size: 36.0,
      ),
      title: Text(
        'Show Map',
        style: TextStyle(fontSize: 18.0),
      ),onTap: (){
        setState(() {
         myWidget = MyMap();
         Navigator.of(context).pop(); 
        });
      },
    );
  }

  Widget menuShowProduct() {
    return ListTile(
      leading: Icon(
        Icons.business_center,
        color: Colors.blue,
        size: 36.0,
      ),
      title: Text(
        'Show Product',
        style: TextStyle(fontSize: 18.0),
      ),onTap: (){
        setState(() {
         myWidget = ShowProduct();
         Navigator.of(context).pop(); 
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<void> findDisplayName() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      nameString = firebaseUser.displayName;
    });
    print('name = $nameString');
  }

  Widget headMenu() {
    return DrawerHeader(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          colors: [Colors.yellow, Colors.orange[100], Colors.white],
          radius: 1.0,
          center: Alignment.center,
        ),
      ),
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
          ),
          Text('Login by $nameString')
        ],
      ),
    );
  }

  Widget showDrewerMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          headMenu(),
          menuShowProduct(),
          myDivder(),
          menuShowMap(),
          myDivder(),
          menuInfo(),
          myDivder(),
          signOutAnExit(),
          myDivder(),
        ],
      ),
    );
  }

  Widget signOutAnExit() {
    return ListTile(
      leading: Icon(
        Icons.exit_to_app,
        size: 36.0,
        color: Colors.red,
      ),
      title: Text(
        'SingOut & Exit',
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
      onTap: () {
        mySignOut();
      },
    );
  }

  Future<void> mySignOut() async {
    await firebaseAuth.signOut().then((response) {
      exit(0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My service'),
      ),
      body: myWidget,
      drawer: showDrewerMenu(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:ung_so145/screens/myservice.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // explicit
  final formKey = GlobalKey<FormState>();
  String nameString, emailString, passwordString;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

// Medthod
  Widget nameText() {
    return TextFormField(
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
      validator: (String value) {
        if (value.isEmpty) {
          return 'Please Fill Name in Blank';
        }
      },
      onSaved: (String value) {
        nameString = value;
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email',
        labelStyle: TextStyle(color: Colors.blue[800]),
        helperText: 'Type you@email.com',
        helperStyle: TextStyle(color: Colors.blue[800]),
        icon: Icon(
          Icons.email,
          size: 36.0,
          color: Colors.blue[800],
        ),
      ),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Type Email Format';
        }
      },
      onSaved: (String value) {
        emailString = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'password',
        labelStyle: TextStyle(color: Colors.yellow[800]),
        helperText: 'more 6 charactor',
        helperStyle: TextStyle(color: Colors.yellow[800]),
        icon: Icon(
          Icons.lock,
          size: 36.0,
          color: Colors.yellow[800],
        ),
      ),
      validator: (String value) {
        if (value.length <= 5) {
          return 'Pass Much More 6 Charactor';
        }
      },
      onSaved: (String value) {
        passwordString = value;
      },
    );
  }

  Widget uploadButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        print('Upload');
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          print(
              'Name = $nameString, Email = $emailString, Pass =$passwordString');
          register();
        }
      },
    );
  }
  
  Future<void> register() async {
    
    await firebaseAuth
        .createUserWithEmailAndPassword(
      email: emailString,
      password: passwordString,
    )
        .then((objResponse) {
      print('Register Success');
      setUpDisplayName();
    }).catchError((objResponse) {
      print('${objResponse.toString()}');
      myAlert(objResponse.code.toString(), objResponse.message.toString());
    });
  }

  void myAlert(String titleString, String massageString) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              titleString,
              style: TextStyle(color: Colors.pink),
            ),
            content: Text(massageString),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  Future<void> setUpDisplayName() async {
    await firebaseAuth.currentUser().then((response) {
      UserUpdateInfo updateInfo = UserUpdateInfo();
      updateInfo.displayName = nameString;
      response.updateProfile(updateInfo);

      var serviceRoute =
          MaterialPageRoute(builder: (BuildContext context) => Myservice());
      Navigator.of(context).pushAndRemoveUntil(serviceRoute, (Route<dynamic>route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Register'),
        actions: <Widget>[uploadButton()],
      ),
      body: Form(
        key: formKey,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/pp.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top: 60.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            decoration:
                BoxDecoration(color: Color.fromRGBO(255, 255, 255, 0.5)),
            width: 280.0,
            height: 280.0,
            child: Column(
              children: <Widget>[nameText(), emailText(), passwordText()],
            ),
          ),
        ),
      ),
    );
  }
}

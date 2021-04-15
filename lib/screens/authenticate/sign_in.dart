import 'package:brew_crew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleForm;
  SignIn({this.toggleForm});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String Email = "";
  String Password = "";
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Sign in to Brew Crew"),
        actions: [
          FlatButton.icon(
              onPressed: () {
                widget.toggleForm();
              },
              icon: Icon(Icons.person_add_alt_1_outlined, color: Colors.white),
              label: Text("Register",
                  style: TextStyle(
                    color: Colors.white,
                  ))),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    Email = val;
                  });
                },
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (val) {
                  setState(() {
                    Password = val;
                  });
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: Colors.pink[300],
                onPressed: () {
                  print(Email);
                  print(Password);
                },
                child: Text("Sign In"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:brew_crew/shared/loader.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  final Function toggleForm;
  Register({this.toggleForm});

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;

// Text field States

  String email = "";
  String password = "";
  String error = "";

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text("Register to Brew Crew"),
              actions: [
                FlatButton.icon(
                    onPressed: () {
                      widget.toggleForm();
                    },
                    icon: Icon(Icons.login, color: Colors.white),
                    label: Text("Login",
                        style: TextStyle(
                          color: Colors.white,
                        ))),
              ],
            ),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        hintText: "Email",
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Enter an Email";
                        } else if (!val.contains("@") ||
                            !val.contains(".com")) {
                          return "Enter a Valid Email";
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      decoration: textInputDecoration.copyWith(
                        hintText: "Password",
                      ),
                      validator: (val) {
                        if (val.isEmpty) {
                          return "Enter a Password";
                        } else if (val.length < 6 || val.length > 20) {
                          return "Length Should be between 6 & 20 Characters";
                        }
                        return null;
                      },
                      onChanged: (val) {
                        setState(() {
                          password = val;
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
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            loading = true;
                          });
                          dynamic result = await _auth
                              .registerWithEmailAndPassword(email, password);
                          if (result == null) {
                            setState(() {
                              loading = false;
                              error = "Please Provide a Valid Email";
                            });
                          }
                        }
                      },
                      child: Text(
                        "Register",
                        style: buttonTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

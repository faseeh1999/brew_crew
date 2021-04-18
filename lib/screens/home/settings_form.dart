import 'package:brew_crew/models/user.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/shared/loader.dart';
import 'package:flutter/material.dart';
import 'package:brew_crew/shared/constants.dart';
import 'package:provider/provider.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4'];

  //String Values
  String _currentName;
  String _currentSugars;
  int _currentStrength;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            UserData userData = snapshot.data;
            print(snapshot.data);
            return Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Text(
                    "Update Your Brew Settings",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(
                    height: size.height * 0.04,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                    child: Column(
                      children: [
                        TextFormField(
                          initialValue: userData.name,
                          decoration: textInputDecoration,
                          validator: (val) =>
                              val.isEmpty ? 'Please Enter a Name' : null,
                          onChanged: (val) {
                            setState(() {
                              _currentName = val;
                            });
                          },
                        ),
                        SizedBox(height: size.height * 0.03),
                        //DropDown
                        DropdownButtonFormField(
                            decoration: textInputDecoration,
                            value: _currentSugars ?? userData.sugars,
                            items: sugars.map((sugar) {
                              return DropdownMenuItem(
                                value: sugar,
                                child: Text("$sugar sugars"),
                              );
                            }).toList(),
                            onChanged: (val) {
                              setState(() {
                                _currentSugars = val;
                              });
                            }),
                        SizedBox(height: size.height * 0.03),
                        Slider(
                          value: (_currentStrength ?? 100).toDouble(),
                          activeColor: Colors
                              .brown[_currentStrength ?? userData.strength],
                          inactiveColor: Colors
                              .brown[_currentStrength ?? userData.strength],
                          min: 100,
                          max: 900,
                          divisions: 8,
                          onChanged: (double value) {
                            setState(() {
                              _currentStrength = value.toInt();
                            });
                          },
                        ),
                        RaisedButton(
                          color: Colors.pink[300],
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              await DatabaseService(uid: userData.uid)
                                  .updateUserDate(
                                      _currentName ?? userData.name,
                                      _currentSugars ?? userData.sugars,
                                      _currentStrength ?? userData.strength);
                              Navigator.of(context).pop();
                            }
                          },
                          child: Text(
                            "Update",
                            style: buttonTextStyle,
                          ),
                        ),
                      ],
                    ),

                    //
                  ),

                  //Slider
                ],
              ),
            );
          } else {
            return Loading();
          }
        });
  }
}

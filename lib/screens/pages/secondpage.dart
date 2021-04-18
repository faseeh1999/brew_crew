import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_list.dart';
import 'package:brew_crew/screens/home/settings_form.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/services/database.dart';
import 'package:brew_crew/shared/drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return SettingsForm();
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brews,
      child: Scaffold(
        backgroundColor: Colors.brown[100],
        drawer: MainDrawer(),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text("Home"),
          actions: [
            IconButton(
              onPressed: () {
                _showSettingsPanel();
              },
              icon: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              // label: Text(
              //   "Logout",
              //   style: TextStyle(color: Colors.white),
              // )
            ),
            IconButton(
              onPressed: () async {
                await _auth.signOut();
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ),
              // label: Text(
              //   "Logout",
              //   style: TextStyle(color: Colors.white),
              // )
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/coffee_bg.png'), fit: BoxFit.cover),
          ),
          child: BrewList(),
        ),
      ),
    );
  }
}

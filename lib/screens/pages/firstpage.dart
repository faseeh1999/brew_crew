import 'package:brew_crew/services/auth.dart';
import 'package:brew_crew/shared/drawer.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      drawer: MainDrawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text("Search"),
        actions: [
          IconButton(
            onPressed: () async {
              await _auth.signOut();
            },
            icon: Icon(
              Icons.logout,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: Text("First Page"),
      ),
    );
  }
}

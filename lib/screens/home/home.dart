import 'package:brew_crew/screens/pages/firstpage.dart';
import 'package:brew_crew/screens/pages/secondpage.dart';
import 'package:brew_crew/screens/pages/thirdpage.dart';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 1;
  var _pages = [FirstPage(), SecondPage(), ThirdPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[400],
        backgroundColor: Colors.brown[400],
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_outlined,
              //color: Colors.white,
            ),
            label: "Search",
            // label: Text("Home", style: TextStyle(color: Colors.white)
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border_outlined),
            label: "Bookmarks",
          ),

          // BottomNavigationBarItem(
          //   icon: Icon(Icons.notifications_none_outlined),
          //   label: "Notification",
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.settings),
          //   label: "Settings",
          // ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.brown[400],
      //   elevation: 0.0,
      //   title: Text("Brew Crew"),
      //   actions: [
      //     FlatButton.icon(
      //         onPressed: () async {
      //           await _auth.signOut();
      //         },
      //         icon: Icon(
      //           Icons.logout,
      //           color: Colors.white,
      //         ),
      //         label: Text(
      //           "Logout",
      //           style: TextStyle(color: Colors.white),
      //         ))
      //   ],
      // ),
      body: _pages[_selectedIndex],
    );
  }
}

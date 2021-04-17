import 'package:brew_crew/screens/pages/fifthpage.dart';
import 'package:brew_crew/screens/pages/fourthpage.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        color: Colors.brown[400],
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.15, bottom: size.height * 0.05),
                child: Icon(
                  Icons.person_outline,
                  color: Colors.white,
                  size: size.width * 0.17,
                ),
              ),
              Text(
                "Name",
                style:
                    TextStyle(color: Colors.white, fontSize: size.width * 0.05),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              Text(
                "Email",
                style:
                    TextStyle(color: Colors.white, fontSize: size.width * 0.04),
              ),
              SizedBox(
                height: size.height * 0.08,
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width * 0.1),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RaisedButton.icon(
                          label: Text("Notifications",
                              style: TextStyle(
                                fontFamily: 'ss',
                                fontSize: size.width * 0.045,
                              )),
                          icon: Icon(Icons.notifications_none_outlined),
                          elevation: 0.0,
                          //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FourthPage()));
                          },
                          textColor: Colors.white,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    height: size.height * 0.05,
                    width: size.width * 0.8,
                    child: Padding(
                      padding: EdgeInsets.only(left: size.width * 0.1),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: RaisedButton.icon(
                          label: Text("Setings",
                              style: TextStyle(
                                fontFamily: 'ss',
                                fontSize: size.width * 0.045,
                              )),
                          icon: Icon(Icons.settings),
                          elevation: 0.0,
                          //padding: EdgeInsets.symmetric(horizontal: size.width*0.35,vertical: size.height*0.02),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FifthPage()));
                          },
                          textColor: Colors.white,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]),
      ),
    );
  }
}

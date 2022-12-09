// ignore: unused_import
import 'dart:developer';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/screen/app_reviews.dart';
import 'package:quiz_app/screen/home.dart';
import 'package:quiz_app/screen/login.dart';
import 'package:quiz_app/screen/profile.dart';
import 'package:quiz_app/screen/settings_screen.dart';
import 'package:quiz_app/services/auth.dart';

// ignore: must_be_immutable
class SideNav extends StatelessWidget {
  String name;
  String money;
  String rank;
  String proUrl;
  String level;
  SideNav(
      {super.key,
      required this.name,
      required this.money,
      required this.rank,
      required this.proUrl,
      required this.level});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 270.0,
      child: Material(
        color: Color.fromARGB(255, 244, 116, 111),
        child: ListView(
          // padding: EdgeInsets.symmetric(horizontal: 20.0),
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(
                              name: name,
                              proUrl: proUrl,
                              rank: rank,
                              level: level,
                              money: money,
                            )));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 30.0,
                          backgroundImage: NetworkImage(proUrl),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "Coins: $money",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Row(
                      children: [
                        Text(
                          "Leaderboard - ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        AnimatedTextKit(
                          repeatForever: true,
                          animatedTexts: [
                            FadeAnimatedText(
                              '$rank th Rank',
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              indent: 20.0,
              endIndent: 20.0,
            ),
            SizedBox(
              height: 20.0,
            ),
            ListTile(
              leading: Icon(
                Icons.quiz,
                color: Colors.white,
              ),
              hoverColor: Colors.white60,
              title: Text(
                "Daily quiz",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              onTap: () async {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Home()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              hoverColor: Colors.white60,
              title: Text(
                "Settings",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              onTap: () async {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => SettingsScreen()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.star,
                color: Colors.white,
              ),
              hoverColor: Colors.white60,
              title: Text(
                "App reviews",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              onTap: () async {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => AppReviews()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.question_answer,
                color: Colors.white,
              ),
              hoverColor: Colors.white60,
              title: Text(
                "How to use",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              onTap: () async {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Home()));
              },
            ),
            ListTile(
              leading: Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
              hoverColor: Colors.white60,
              title: Text(
                "Logout",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              onTap: () async {
                await signOutGoogleAndFacebook();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Login()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

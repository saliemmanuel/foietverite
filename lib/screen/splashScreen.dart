import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foi_et_verite_2/screen/homeScreen.dart';
import 'package:foi_et_verite_2/utils/colorsApp.dart';
import 'package:foi_et_verite_2/utils/route.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      pushNewPageRemoveUntil(
          HomeScreen(userIsConnected: prefs.getString('login')), context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsApp.primaryColors,
      body: Center(
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/logo.png", height: 250.0),
                SizedBox(height: 90.0),
                Text(
                  "FOI ET VERITE",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: ColorsApp.textColors,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 15.0),
                Text("Par le Père LOLO Jacques",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: ColorsApp.actionColors)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

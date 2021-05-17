import 'dart:async';
import 'package:flutter/material.dart';
import 'loginScreen.dart';
import '../db/db.dart';
import '../utils/colorsApp.dart';
import '../utils/route.dart';
import 'homeScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List userIsConnected;
  @override
  void initState() {
    super.initState();
    readUserData();
    Timer(Duration(seconds: 3), () async {
      pushNewPageRemoveUntil(
          userIsConnected == null
              ? LoginScreen()
              : HomeScreen(
                  nom: userIsConnected[0]["nom"],
                  prenom: userIsConnected[0]["prenom"],
                  telephone: userIsConnected[0]["numTel"],
                  email: userIsConnected[0]["email"],
                ),
          context);
    });
  }

  readUserData() async {
    userIsConnected = await getItems();
    print(userIsConnected);
    setState(() {});
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

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:foi_et_verite/utils/notificationManager.dart';
import 'loginScreen.dart';
import '../db/db.dart';
import '../utils/colorsApp.dart';
import '../utils/route.dart';
import 'homeScreen.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/url.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  List userIsConnected;
  List notificationList;
  NotificationManager notificationManager = NotificationManager();
  @override
  void initState() {
    readUserData();
    getNotification();
    timerSplash();
    super.initState();
  }

  readUserData() async {
    setState(() {});
    userIsConnected = await getItems();
  }

  getNotification() async {
    var index = "7";
    var data = await http.post(UrlApi.urlApi(), body: {
      "index": index,
    });
    if (data.statusCode == 200) {
      var response = jsonDecode(data.body);
      setState(() => notificationList = response);
      for (var i = 0; i < notificationList.length; i++) {
        notificationManager.showNotification(i, notificationList[i]["body"]);
      }
    }
  }

  timerSplash() {
    Timer(Duration(seconds: 3), () async {
      if (userIsConnected.isNotEmpty) {
        pushNewPageRemoveUntil(
            HomeScreen(
              nom: userIsConnected[0]["nom"],
              prenom: userIsConnected[0]["prenom"],
              telephone: userIsConnected[0]["numTel"],
              email: userIsConnected[0]["email"],
            ),
            context);
        notificationManager.initnotification();
      } else {
        pushNewPageRemoveUntil(LoginScreen(), context);
      }
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

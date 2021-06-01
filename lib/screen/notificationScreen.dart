import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foi_et_verite/utils/colorsApp.dart';
import 'package:foi_et_verite/widgets/cardNotification.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColors,
        title: Text("Notification"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: ColorsApp.bodyBackgroundColor,
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: RefreshIndicator(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (_, i) {
              return CardNotification(
                title: "Notification",
              );
            },
          ),
          onRefresh: () async {},
        ),
      ),
    );
  }
}

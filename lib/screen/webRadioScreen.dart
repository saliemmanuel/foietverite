import 'package:flutter/material.dart';

import '../utils/colorsApp.dart';
import '../widgets/cardWebRadio.dart';

class WebRadioScreen extends StatefulWidget {
  @override
  _WebRadioScreenState createState() => _WebRadioScreenState();
}

class _WebRadioScreenState extends State<WebRadioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColors,
        title: Text("Webradio"),
      ),
      body: Container(
          decoration: BoxDecoration(
            color: ColorsApp.bodyBackgroundColor,
            image: DecorationImage(
              image: AssetImage("assets/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView.builder(
              itemCount: 18,
              itemBuilder: (_, i) {
                return CardWebRadio();
              })),
    );
  }
}

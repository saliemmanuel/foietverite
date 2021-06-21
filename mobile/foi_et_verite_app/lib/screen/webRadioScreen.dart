import 'package:flutter/material.dart';

import '../utils/colorsApp.dart';

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
          child: Center(
            child: Card(
                child: Text(
                    "\n  Disponible à la prochaine version de Foi et Vérité (v2) \n")),
          )),
    );
  }
}

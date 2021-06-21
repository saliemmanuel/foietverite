import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colorsApp.dart';

class Enseignements extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColors,
        title: Text("Enseignements"),
      ),
      body: Container(
          decoration: BoxDecoration(
            color: ColorsApp.bodyBackgroundColor,
            image: DecorationImage(
              image: AssetImage("assets/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.reply_all_rounded,
                        color: Colors.red,
                      ),
                      title: Text("Enseignements Biblique",
                          style: TextStyle(color: Colors.blue)),
                      onTap: () => launchUrl(
                          "https://foietverite.000webhostapp.com/Enseignements.html"),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(
                        Icons.reply_all_rounded,
                        color: Colors.red,
                      ),
                      title: Text("Les prières",
                          style: TextStyle(color: Colors.blue)),
                      onTap: () => launchUrl(
                          "https://foietverite.000webhostapp.com/Prieres.html"),
                    ),
                  ],
                ),
              ),
            ),
          ])),
    );
  }

  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Impossible de lancer l\'url $url';
    }
  }
}

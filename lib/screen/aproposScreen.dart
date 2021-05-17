import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:url_launcher/url_launcher.dart';

import '../utils/colorsApp.dart';

class AproposScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                      Icons.info,
                      color: Colors.black87,
                    ),
                    title: Text(
                        "Foi et Vérité une application du Père LOLO Jacques\nv1.0.0 Copyright 2021"),
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
                      Icons.bookmark,
                      color: Colors.black87,
                    ),
                    title: Text(
                        "Domaine d’activité : Réligion, A pour objetif d'évangélisation à travers le monde et œuvres humanitaires\n"),
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
                      Icons.language,
                      color: Colors.black87,
                    ),
                    title: Text(
                        "Notre site Internet\nhttps://foietverite.000webhostapp.com/",
                        style: TextStyle(color: Colors.blue)),
                    onTap: () =>
                        launchUrl("https://foietverite.000webhostapp.com"),
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
                      LineIcons.youtube_play,
                      color: Colors.red,
                    ),
                    title: Text(
                        "Notre chaîne Youtube\nhttps://www.youtube.com/channel/UC1EuGJsjTsQa1ZQ5uIei-Pg",
                        style: TextStyle(color: Colors.blue)),
                    onTap: () => launchUrl(
                        "https://www.youtube.com/channel/UC1EuGJsjTsQa1ZQ5uIei-Pg"),
                  ),
                ],
              ),
            ),
          ),
          Card(
              child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(children: <Widget>[
                    ListTile(
                      leading: Icon(
                        LineIcons.facebook,
                        color: Colors.blue,
                      ),
                      title: Text(
                        "Notre page Facebook\nhttps://www.facebook.com/100060702423747/posts/142802267753187",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () => launchUrl(
                          "https://www.facebook.com/100060702423747/posts/142802267753187"),
                    )
                  ]))),
        ]));
  }

  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Impossible de lancer l\'url $url';
    }
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foi_et_verite/widgets/cardDialogue.dart';
import 'package:http/http.dart' as http;
import '../utils/colorsApp.dart';
import '../utils/url.dart';
import '../widgets/cardPodcast.dart';

class PodcastScreen extends StatefulWidget {
  @override
  _PodcastScreenState createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  List podcastList;
  getPodcast() async {
    var indexLogin = "5";
    var data = await http.post(UrlApi.urlApi(), body: {
      "index": indexLogin,
    });
    if (data.statusCode == 200) {
      var response = jsonDecode(data.body);
      setState(() => podcastList = response);
    } else
      errorDialogueCard(
          "Erreur !!!", "Erreur lors du chargement des Annonces", context);
  }

  @override
  void initState() {
    getPodcast();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColors,
        title: Text("Podcasts",
            style: TextStyle(
                color: ColorsApp.textColors, fontWeight: FontWeight.bold)),
      ),
      backgroundColor: ColorsApp.bodyBackgroundColor,
      body: Container(
          decoration: BoxDecoration(
            color: ColorsApp.bodyBackgroundColor,
            image: DecorationImage(
              image: AssetImage("assets/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: podcastList == null
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: podcastList == null ? 0 : podcastList.length,
                  itemBuilder: (_, i) {
                    return CardPodcast(
                      linkPodcast: podcastList[i]['linkPodcast'],
                      titrePodcast: podcastList[i]['titrePodcast'],
                    );
                  })),
    );
  }
}

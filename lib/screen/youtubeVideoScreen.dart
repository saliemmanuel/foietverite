import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../utils/colorsApp.dart';
import '../utils/url.dart';
import '../widgets/cardDialogue.dart';
import '../widgets/cardYoutubeVideo.dart';

class YoutubeViewScreen extends StatefulWidget {
  @override
  _YoutubeViewScreenState createState() => _YoutubeViewScreenState();
}

class _YoutubeViewScreenState extends State<YoutubeViewScreen> {
  List youtubeVideoList;
// ()
  getYoutubeView() async {
    var indexLogin = "4";
    var data = await http.post(UrlApi.urlApi(), body: {
      "index": indexLogin,
    });
    if (data.statusCode == 200) {
      var response = jsonDecode(data.body);
      setState(() => youtubeVideoList = response);
    } else {
      errorDialogueCard(
          "Erreur !!!", "Erreur lors du chargement des Annonces", context);
    }
  }

  @override
  void initState() {
    getYoutubeView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsApp.primaryColors,
          title: Text("Youtube"),
        ),
        body: Container(
            decoration: BoxDecoration(
              color: ColorsApp.bodyBackgroundColor,
              image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: youtubeVideoList == null
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount:
                        youtubeVideoList == null ? 0 : youtubeVideoList.length,
                    itemBuilder: (_, i) {
                      return CardYoutubeVideo(
                        titreVideoYoutube: youtubeVideoList[i]
                            ['titreVideoYoutube'],
                        lienVideoYoutube: youtubeVideoList[i]
                            ['linkVideoYoutube'],
                        descriptionVideoYoutube: youtubeVideoList[i]
                            ['descriptionVideoYoutube'],
                      );
                    })));
  }
}

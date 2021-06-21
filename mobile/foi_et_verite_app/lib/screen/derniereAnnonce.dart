import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../utils/colorsApp.dart';
import '../utils/url.dart';
import '../widgets/cardDerniereAnnonce.dart';
import '../widgets/cardDialogue.dart';

class DernierAnnonce extends StatefulWidget {
  @override
  _DernierAnnonceState createState() => _DernierAnnonceState();
}

class _DernierAnnonceState extends State<DernierAnnonce> {
  List annonceList;
  getAnnonces() async {
    var indexLogin = "3";
    var data = await http.post(UrlApi.urlApi(), body: {
      "index": indexLogin,
    });
    if (data.statusCode == 200) {
      var response = jsonDecode(data.body);
      setState(() => annonceList = response);
    } else {
      errorDialogueCard(
          "Erreur !!!", "Erreur lors du chargement des Annonces", context);
    }
    if (data.statusCode == 110) {
      errorDialogueCard("Erreur !!!", "Time out !", context);
    }
  }

  @override
  void initState() {
    getAnnonces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColors,
        title: Text("Dernières annonces"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: ColorsApp.bodyBackgroundColor,
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: annonceList == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: annonceList == null ? 0 : annonceList.length,
                itemBuilder: (_, i) {
                  return CardDerniereAnnonce(
                      dateArticle: annonceList[i]["datePublication"],
                      titreArticle: annonceList[i]["titreAnnonces"],
                      corpsArticle: annonceList[i]["corpsAnnonces"],
                      auteur: annonceList[i]["auteurAnnonces"]);
                }),
      ),
    );
  }
}

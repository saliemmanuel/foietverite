import 'package:flutter/material.dart';

import '../utils/colorsApp.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:foi_et_verite/utils/url.dart';
import 'package:foi_et_verite/widgets/cardDialogue.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController controller = new TextEditingController();
  List searchList;
  search(String val) async {
    var indexLogin = "6";
    var data = await http
        .post(UrlApi.urlApi(), body: {"index": indexLogin, "key": 'marie'});
    if (data.statusCode == 200) {
      var response = jsonDecode(data.body);
      setState(() => searchList = response);
      print(response);
    } else {
      errorDialogueCard("Erreur !!!", "Erreur lors du chargement", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorsApp.textColors,
          title: TextField(
            controller: controller,
            enableSuggestions: true,
            cursorColor: Colors.black,
            autocorrect: true,
            // onChanged: (value) => search(value),
            onSubmitted: (value) => search(value),
            decoration: InputDecoration(
                hintText: "Mots clé ici",
                disabledBorder: InputBorder.none,
                border: InputBorder.none),
          ),
          actions: [
            IconButton(
                icon: Icon(Icons.search, color: Colors.black),
                onPressed: () => search(controller.text))
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              color: ColorsApp.bodyBackgroundColor,
              image: DecorationImage(
                image: AssetImage("assets/bg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: searchList == null
                ? Center()
                : ListView.builder(
                    itemCount: searchList == null ? 0 : searchList.length,
                    itemBuilder: (_, i) {
                      return Card(
                        child: ListTile(
                            title: Text("${searchList[i]['titreAnnonces']}")),
                      );
                    })));
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../db/db.dart';
import '../models/utilisateurmobileModels.dart';
import '../utils/colorsApp.dart';
import '../utils/route.dart';
import '../utils/url.dart';
import '../widgets/cardDialogue.dart';
import 'homeScreen.dart';
import 'newProfilScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _loginController;
  TextEditingController _passController;

  @override
  void initState() {
    _loginController = new TextEditingController();
    _passController = new TextEditingController();
    super.initState();
  }

  getLogin(String login, String pass) async {
    simpleDialogueCardSansTitle("Connexion en cour ...", context);
    var indexLogin = "1";
    var data = await http.post(UrlApi.urlApi(), body: {
      "index": indexLogin,
      "login": login,
      "pass": pass,
    });
    if (data.statusCode == 200) {
      var response = jsonDecode(data.body);
      if (response[0]['haveError'] == 'false') {
        Utilisateurmobile utilisateurmobile =
            Utilisateurmobile.buildUtilisateur(response);
        saveNewUtilisateurmobile(utilisateurmobile);
        pushNewPageRemoveUntil(
            HomeScreen(
              nom: utilisateurmobile.nom,
              prenom: utilisateurmobile.prenom,
              telephone: utilisateurmobile.numTel,
              email: utilisateurmobile.email,
            ),
            context);
      } else {
        Navigator.pop(context);
        errorDialogueCard("Erreur !!!", "${response[0]['message']}", context);
      }
    } else if (data.statusCode < 200) {
      Navigator.pop(context);
      errorDialogueCard("Connexion", "Time out !", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: ColorsApp.bodyBackgroundColor,
            image: DecorationImage(
              image: AssetImage("assets/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: ListView(
              children: [
                SizedBox(height: 20.0),
                Image.asset("assets/logo.png", height: 170.0),
                SizedBox(height: 15.0),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Connexion",
                    style:
                        TextStyle(fontSize: 19.0, color: ColorsApp.textColors),
                  ),
                ),
                SizedBox(height: 20.0),
                custumTextField(
                    _loginController, false, Icon(Icons.person), "login"),
                SizedBox(height: 8.0),
                custumTextField(_passController, true,
                    Icon(Icons.vpn_key_rounded), "mot de passe"),
                SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: MaterialButton(
                              color: Colors.yellow,
                              child: Text(
                                "Se connecter ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                if (_loginController.text.isEmpty ||
                                    _passController.text.isEmpty)
                                  errorDialogueCard(
                                      "Erreur !!!",
                                      "Renseigner tous les champs svp !!!",
                                      context);
                                else
                                  getLogin(_loginController.text,
                                      _passController.text);
                              }),
                        ),
                        Text(' '),
                        Expanded(
                          child: MaterialButton(
                              color: Colors.teal,
                              child: Text(
                                "Créer un compte",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () =>
                                  pushNewPage(NewProfilScreen(), context)),
                        )
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

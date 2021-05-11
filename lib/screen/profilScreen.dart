import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foi_et_verite_2/screen/newProfilScreen.dart';
import 'package:foi_et_verite_2/utils/colorsApp.dart';
import 'package:foi_et_verite_2/utils/route.dart';
import 'package:foi_et_verite_2/utils/sharedPerf.dart';
import 'package:foi_et_verite_2/utils/url.dart';
import 'package:foi_et_verite_2/widgets/cardDialogue.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ProfilScreen extends StatefulWidget {
  final String userIsConnected;
  final String nom;
  final String prenom;
  final String numTel;
  final String email;

  const ProfilScreen(
      {Key key,
      this.userIsConnected,
      this.nom,
      this.prenom,
      this.numTel,
      this.email})
      : super(key: key);
  @override
  _ProfilScreenState createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  TextEditingController _loginController;
  TextEditingController _passController;

  @override
  void initState() {
    _loginController = new TextEditingController();
    _passController = new TextEditingController();
    super.initState();
  }

  getLogin(String login, String pass) async {
    simpleDialogueCard("Connexion", "Connexion en cour ...", context);
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var indexLogin = "1";
    var data = await http.post(UrlApi.urlApi(), body: {
      "index": indexLogin,
      "login": login,
      "pass": pass,
    });

    if (data.statusCode == 200) {
      var response = jsonDecode(data.body);
      if (response[0]['haveError'] == 'false') {
        Navigator.pop(context);
        errorDialogueCard("Connexion", "${response[0]['message']}", context);
        prefs.setString('login', 'ok');
      } else {
        Navigator.pop(context);
        errorDialogueCard("Erreur !!!", "${response[0]['message']}", context);
      }
    } else if (data.statusCode > 200) {
      Navigator.pop(context);
      errorDialogueCard("Connexion", "Time out !", context);
    }
  }

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
                style: TextStyle(fontSize: 19.0, color: ColorsApp.textColors),
              ),
            ),
            SizedBox(height: 20.0),
            custumTextField(
                _loginController, false, Icon(Icons.person), "login"),
            SizedBox(height: 8.0),
            custumTextField(_passController, true, Icon(Icons.vpn_key_rounded),
                "mot de passe"),
            SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: <
                      Widget>[
                Expanded(
                  child: MaterialButton(
                      color: Colors.yellow,
                      child: Text(
                        "Se connecter ",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        if (_loginController.text.isEmpty ||
                            _passController.text.isEmpty)
                          errorDialogueCard("Erreur !!!",
                              "Renseigner tous les champs svp !!!", context);
                        else
                          getLogin(_loginController.text, _passController.text);
                      }),
                ),
                Text(' '),
                Expanded(
                  child: MaterialButton(
                      color: Colors.teal,
                      child: Text(
                        "Créer un compte",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () => pushNewPage(NewProfilScreen(), context)),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}

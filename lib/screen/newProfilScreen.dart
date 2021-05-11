import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:foi_et_verite_2/utils/colorsApp.dart';
import 'package:foi_et_verite_2/utils/url.dart';
import 'package:foi_et_verite_2/widgets/cardDialogue.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NewProfilScreen extends StatefulWidget {
  @override
  _NewProfilScreenState createState() => _NewProfilScreenState();
}

class _NewProfilScreenState extends State<NewProfilScreen> {
  TextEditingController _loginController;
  TextEditingController _passController;
  TextEditingController _nomController;
  TextEditingController _prenomController;
  TextEditingController _numTelController;
  TextEditingController _emailController;

  @override
  void initState() {
    _loginController = new TextEditingController();
    _passController = new TextEditingController();
    _nomController = new TextEditingController();
    _prenomController = new TextEditingController();
    _numTelController = new TextEditingController();
    _emailController = new TextEditingController();

    super.initState();
  }

  createAccount(String login, String pass, String nom, String prenom,
      String numTel, String email) async {
    simpleDialogueCard("Créer compte", "Creation en cour ...", context);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var index = "2";
    var data = await http.post(UrlApi.urlApi(), body: {
      "index": index,
      "login": login,
      "pass": pass,
      "nom": nom,
      "prenom": prenom,
      "numTel": numTel,
      "email": email,
    });

    if (data.statusCode == 200) {
      var response = jsonDecode(data.body);
      if (response[0]['haveError'] == 'false') {
        Navigator.pop(context);
        prefs.setString('login', 'ok');
        errorDialogueCard("Créer compte", "${response[0]['message']}", context)
            .then((value) {
          Navigator.pop(context);
        });
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColors,
        title: Text("Créer un compte"),
      ),
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
              custumTextField(
                  _loginController, false, Icon(Icons.person), "login"),
              SizedBox(height: 8.0),
              custumTextField(_passController, true,
                  Icon(Icons.vpn_key_rounded), "mot de passe"),
              SizedBox(height: 8.0),
              custumTextField(_nomController, false, Icon(Icons.person), "nom"),
              SizedBox(height: 8.0),
              custumTextField(
                  _prenomController, false, Icon(Icons.person), "prenom"),
              SizedBox(height: 8.0),
              custumTextField(
                  _numTelController, false, Icon(Icons.phone), "téléphone"),
              SizedBox(height: 8.0),
              custumTextField(
                  _emailController, false, Icon(Icons.email_rounded), "email"),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: MaterialButton(
                            color: Colors.teal,
                            child: Text(
                              "Créer un compte",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () => createAccount(
                                _loginController.text,
                                _passController.text,
                                _nomController.text,
                                _prenomController.text,
                                _numTelController.text,
                                _emailController.text)),
                      ),
                      Text(' '),
                      Expanded(
                        child: MaterialButton(
                            color: Colors.red,
                            child: Text(
                              "Annuler",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () => Navigator.pop(context)),
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget custumTextField(TextEditingController controller, bool isPass,
    Icon prefixIcon, String hintText) {
  return Card(
    child: TextField(
      controller: controller,
      obscureText: isPass ? true : false,
      enableSuggestions: true,
      cursorColor: Colors.black,
      autocorrect: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          prefixIcon: prefixIcon,
          hintText: hintText,
          alignLabelWithHint: true),
    ),
  );
}

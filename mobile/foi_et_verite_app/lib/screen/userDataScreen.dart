import 'package:flutter/material.dart';
import 'package:foi_et_verite/db/db.dart';
import 'package:foi_et_verite/utils/route.dart';
import '../utils/colorsApp.dart';
import 'loginScreen.dart';

class UserData extends StatelessWidget {
  final String nom;
  final String prenom;
  final String numTel;
  final String email;
  const UserData({Key key, this.nom, this.prenom, this.numTel, this.email})
      : super(key: key);

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
          child: ListTile(
            title: Text("VOS INFORMATIONS",
                style: TextStyle(color: ColorsApp.primaryColors)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text("nom et prenom",
                style: TextStyle(color: ColorsApp.primaryColors)),
            subtitle: Text("$nom $prenom",
                style:
                    TextStyle(fontSize: 19.0, color: ColorsApp.primaryColors)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.phone),
            title: Text("Téléphone",
                style: TextStyle(color: ColorsApp.primaryColors)),
            subtitle: Text("$numTel",
                style:
                    TextStyle(fontSize: 19.0, color: ColorsApp.primaryColors)),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(Icons.email_rounded),
            title: Text("E-mail",
                style: TextStyle(color: ColorsApp.primaryColors)),
            subtitle: Text("$email",
                style:
                    TextStyle(fontSize: 19.0, color: ColorsApp.primaryColors)),
          ),
        ),
        Card(
          color: Colors.red,
          child: ListTile(
            leading: Icon(Icons.logout),
            title: Text("Déconnexion",
                style: TextStyle(color: ColorsApp.primaryColors)),
            onTap: () {
              deleteItem();
              pushNewPageRemoveUntil(LoginScreen(), context);
            },
          ),
        ),
      ]),
    );
  }
}

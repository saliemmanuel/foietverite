import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:toast/toast.dart';

import '../utils/colorsApp.dart';
import '../widgets/homeWidget.dart';
import 'aproposScreen.dart';
import 'searchScreen.dart';
import 'userDataScreen.dart';

class HomeScreen extends StatefulWidget {
  final String nom;
  final String prenom;
  final String telephone;
  final String email;

  const HomeScreen({Key key, this.nom, this.prenom, this.telephone, this.email})
      : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _children = [
      AcceuilScreen(),
      SearchScreen(),
      AproposScreen(),
      UserData(
        nom: widget.nom,
        prenom: widget.prenom,
        numTel: widget.telephone,
        email: widget.email,
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            _currentIndex == 1 ? ColorsApp.textColors : ColorsApp.primaryColors,
        elevation: 0,
        title: _currentIndex == 1
            ? TextField(
                enableSuggestions: true,
                cursorColor: Colors.black,
                autocorrect: true,
                decoration: InputDecoration(
                    hintText: "Mots clé ici",
                    disabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    suffixIcon:
                        IconButton(icon: Icon(Icons.search), onPressed: () {})))
            : Text("Foi et vérité",
                style: TextStyle(
                    color: ColorsApp.textColors, fontWeight: FontWeight.bold)),
        actions: [
          _currentIndex == 1
              ? SizedBox()
              : Stack(
                  children: [
                    IconButton(
                        icon: Icon(Icons.notifications,
                            color: ColorsApp.textColors),
                        onPressed: () =>
                            Toast.show("---------------", context)),
                  ],
                ),
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
        child: _children[_currentIndex],
      ),
      bottomNavigationBar: Container(
        color: ColorsApp.primaryColors,
        child: SalomonBottomBar(
          unselectedItemColor: ColorsApp.unselectedItemColor,
          selectedColorOpacity: 0.3,
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            SalomonBottomBarItem(
              icon: Icon(LineIcons.home),
              title: Text("Acceuil"),
              selectedColor: ColorsApp.homeBottumIconColor,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.search),
              title: Text("Recherche"),
              selectedColor: Colors.orange,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.help_outline_rounded),
              title: Text("A propos de nous"),
              selectedColor: Colors.blue,
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}

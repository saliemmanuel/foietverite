import 'package:flutter/material.dart';
import 'package:foi_et_verite_2/screen/aproposScreen.dart';
import 'package:foi_et_verite_2/screen/profilScreen.dart';
import 'package:foi_et_verite_2/screen/searchScreen.dart';
import 'package:foi_et_verite_2/utils/colorsApp.dart';
import 'package:foi_et_verite_2/widgets/homeWidget.dart';
import 'package:line_icons/line_icons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:toast/toast.dart';

class HomeScreen extends StatefulWidget {
  final String userIsConnected;
  final int currentIndex;

  const HomeScreen({Key key, this.userIsConnected, this.currentIndex})
      : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Widget> _children = [
    AcceuilScreen(),
    SearchScreen(),
    AproposScreen(),
    ProfilScreen(userIsConnected: widget.userIsConnected),
  ];
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
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
                        onPressed: () => Toast.show(
                            "Aucune notification disponible", context)),
                    // Positioned(
                    //     right: 13.0,
                    //     top: 12.0,
                    //     child: Container(
                    //       height: 10.0,
                    //       width: 10.0,
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(25.0),
                    //           color: Colors.red),
                    //     ))
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

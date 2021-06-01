import 'package:flutter/material.dart';
import 'package:foi_et_verite/utils/notificationManager.dart';
import 'package:foi_et_verite/utils/route.dart';
import 'package:line_icons/line_icons.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../utils/colorsApp.dart';
import '../widgets/homeWidget.dart';
import 'aproposScreen.dart';
import 'notificationScreen.dart';
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
  NotificationManager notificationManager = NotificationManager();

  @override
  void initState() {
    notificationManager.initNotificationSetting(context);
    super.initState();
  }

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
      appBar: _currentIndex == 1
          ? null
          : AppBar(
              backgroundColor: ColorsApp.primaryColors,
              elevation: 0,
              title: Text("Foi et vérité",
                  style: TextStyle(
                      color: ColorsApp.textColors,
                      fontWeight: FontWeight.bold)),
              actions: [
                IconButton(
                    icon:
                        Icon(Icons.notifications, color: ColorsApp.textColors),
                    onPressed: () =>
                        pushNewPage(NotificationScreen(), context)),
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
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.notifications),
        onPressed: () => notificationManager.showNotification(),
      ),
    );
  }
}

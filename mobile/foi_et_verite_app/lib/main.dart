import 'package:flutter/material.dart';
import 'db/db.dart';
import 'screen/splashScreen.dart';
import 'utils/colorsApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDatabase();
  runApp(MaterialApp(
    title: "Foi et vérité",
    home: SplashScreen(),
    theme: ThemeData(
        primaryColor: ColorsApp.primaryColors,
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: ColorsApp.iconAppBarColor)),
        iconTheme: IconThemeData(
          color: ColorsApp.textColors,
        )),
    debugShowCheckedModeBanner: false,
  ));
}

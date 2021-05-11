import 'package:flutter/material.dart';
import 'package:foi_et_verite_2/screen/splashScreen.dart';
import 'package:foi_et_verite_2/utils/colorsApp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    home: SplashScreen(),
    theme: ThemeData(
        appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(color: ColorsApp.iconAppBarColor)),
        iconTheme: IconThemeData(
          color: ColorsApp.textColors,
        )),
    debugShowCheckedModeBanner: false,
  ));
}

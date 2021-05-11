import 'package:flutter/material.dart';
import 'package:foi_et_verite_2/utils/colorsApp.dart';
import 'package:foi_et_verite_2/widgets/cardDerniereAnnonce.dart';

class DernierAnnonce extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColors,
        title: Text("Dernières annonces"),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: ColorsApp.bodyBackgroundColor,
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
            itemCount: 18,
            itemBuilder: (_, i) {
              return CardDerniereAnnonce();
            }),
      ),
    );
  }
}

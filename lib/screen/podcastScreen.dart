import 'package:flutter/material.dart';
import 'package:foi_et_verite_2/utils/colorsApp.dart';
import 'package:foi_et_verite_2/widgets/cardPodcast.dart';

class PodcastScreen extends StatefulWidget {
  @override
  _PodcastScreenState createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.primaryColors,
        title: Text("Podcasts",
            style: TextStyle(
                color: ColorsApp.textColors, fontWeight: FontWeight.bold)),
      ),
      backgroundColor: ColorsApp.bodyBackgroundColor,
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
              return CardPodcast();
            }),
      ),
    );
  }
}

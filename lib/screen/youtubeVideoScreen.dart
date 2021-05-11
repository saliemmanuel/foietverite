import 'package:flutter/material.dart';
import 'package:foi_et_verite_2/utils/colorsApp.dart';
import 'package:foi_et_verite_2/widgets/cardYoutubeVideo.dart';
import 'package:http/http.dart' as http;

class YoutubeViewScreen extends StatefulWidget {
  @override
  _YoutubeViewScreenState createState() => _YoutubeViewScreenState();
}

class _YoutubeViewScreenState extends State<YoutubeViewScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Youtube"),
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
              return CardYoutubeVideo();
            }),
      ),
    );
  }
}

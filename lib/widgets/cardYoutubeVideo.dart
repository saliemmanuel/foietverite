import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../utils/colorsApp.dart';

class CardYoutubeVideo extends StatefulWidget {
  final String titreVideoYoutube;
  final String lienVideoYoutube;
  final String descriptionVideoYoutube;

  const CardYoutubeVideo({
    Key key,
    this.titreVideoYoutube,
    this.lienVideoYoutube,
    this.descriptionVideoYoutube,
  }) : super(key: key);

  @override
  _CardYoutubeVideoState createState() => _CardYoutubeVideoState();
}

class _CardYoutubeVideoState extends State<CardYoutubeVideo> {
  YoutubePlayerController _controller;
  getData() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.lienVideoYoutube),
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: _controller,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
            progressColors: ProgressBarColors(
                playedColor: Colors.red, handleColor: Colors.red),
          ),
          builder: (context, player) {
            return Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    player,
                    Container(
                      color: ColorsApp.unselectedItemColor,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                        child: ListTile(
                          title: Text(widget.titreVideoYoutube,
                              style: TextStyle(color: ColorsApp.textColors)),
                          subtitle: Text(
                              "\n${widget.descriptionVideoYoutube}\n",
                              style: TextStyle(color: Colors.grey)),
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                  right: 5.0,
                  top: 10.0,
                  child: PopupMenuButton(
                    icon: Icon(Icons.more_vert, color: ColorsApp.textColors),
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem(
                        value: "partager",
                        textStyle: TextStyle(color: Colors.black),
                        child: Text("Partager"),
                        enabled: true,
                      ),
                      PopupMenuItem(
                        value: "signaler",
                        textStyle: TextStyle(color: Colors.black),
                        child: Text("Signaler"),
                        enabled: true,
                      ),
                    ],
                    onSelected: (value) {
                      if (value == 'partager')
                        Share.share(widget.lienVideoYoutube);
                      if (value == 'signaler') print("signaler");
                    },
                    tooltip: "Plus de detail",
                  ),
                )
              ],
            );
          }),
    );
  }
}

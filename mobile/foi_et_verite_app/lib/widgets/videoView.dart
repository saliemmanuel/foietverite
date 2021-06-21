import 'package:flutter/material.dart';
import 'package:foi_et_verite/utils/colorsApp.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayVideoPage extends StatefulWidget {
  final String titreVideoYoutube;
  final String lienVideoYoutube;
  final String descriptionVideoYoutube;

  const PlayVideoPage(
      {Key key,
      this.titreVideoYoutube,
      this.lienVideoYoutube,
      this.descriptionVideoYoutube})
      : super(key: key);

  @override
  _PlayVideoPageState createState() => _PlayVideoPageState();
}

class _PlayVideoPageState extends State<PlayVideoPage> {
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
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ColorsApp.primaryColors,
          title: Text(widget.titreVideoYoutube)),
      body: Container(
        decoration: BoxDecoration(
          color: ColorsApp.bodyBackgroundColor,
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              YoutubePlayerBuilder(
                  player: YoutubePlayer(
                    controller: _controller,
                    showVideoProgressIndicator: true,
                    progressIndicatorColor: Colors.red,
                    progressColors: ProgressBarColors(
                        playedColor: Colors.red, handleColor: Colors.red),
                  ),
                  builder: (context, player) {
                    return Column(
                      children: [
                        player,
                        Container(
                          color: ColorsApp.unselectedItemColor,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, top: 10.0),
                            child: ListTile(
                              title: Text(widget.titreVideoYoutube,
                                  style:
                                      TextStyle(color: ColorsApp.textColors)),
                              subtitle: Text(
                                  "\n${widget.descriptionVideoYoutube}\n",
                                  style: TextStyle(color: Colors.grey)),
                            ),
                          ),
                        )
                      ],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

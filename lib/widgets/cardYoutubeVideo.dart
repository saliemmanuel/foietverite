import 'package:flutter/material.dart';
import 'package:foi_et_verite/utils/route.dart';
import 'package:foi_et_verite/widgets/videoView.dart';
import 'package:line_icons/line_icons.dart';

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
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: ListTile(
          leading: Icon(LineIcons.youtube_play, color: Colors.red),
          title: Text("\n${widget.titreVideoYoutube}\n"),
        ),
      ),
      onTap: () => pushNewPage(
          PlayVideoPage(
            descriptionVideoYoutube: widget.descriptionVideoYoutube,
            lienVideoYoutube: widget.lienVideoYoutube,
            titreVideoYoutube: widget.titreVideoYoutube,
          ),
          context),
    );
  }
}

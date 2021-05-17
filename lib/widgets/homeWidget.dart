import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

import '../screen/derniereAnnonce.dart';
import '../screen/enseignementScreen.dart';
import '../screen/nousAiderScreen.dart';
import '../screen/podcastScreen.dart';
import '../screen/webRadioScreen.dart';
import '../screen/youtubeVideoScreen.dart';
import '../utils/route.dart';
import 'cardFoiEtVeriteView.dart';

class AcceuilScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridView.count(
                shrinkWrap: true,
                primary: false,
                padding: const EdgeInsets.all(10),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                crossAxisCount: 2,
                children: <Widget>[
                  FoiEtVeriteViewCard(
                      iconCard: Icons.volunteer_activism,
                      labelCard: "Nous aider",
                      colorCard: Colors.green,
                      onPressed: () => pushNewPage(NousAider(), context)),
                  FoiEtVeriteViewCard(
                      iconCard: Icons.grade_rounded,
                      labelCard: "Dernières annonces",
                      colorCard: Colors.amber,
                      onPressed: () => pushNewPage(DernierAnnonce(), context)),
                  FoiEtVeriteViewCard(
                      iconCard: Icons.assistant_photo,
                      labelCard: "Enseignements",
                      colorCard: Colors.orange,
                      onPressed: () => pushNewPage(Enseignements(), context)),
                  FoiEtVeriteViewCard(
                      iconCard: Icons.mic,
                      labelCard: "Podcasts",
                      colorCard: Colors.pink,
                      onPressed: () => pushNewPage(PodcastScreen(), context)),
                  FoiEtVeriteViewCard(
                      iconCard: Icons.radio,
                      labelCard: "Webradio",
                      colorCard: Colors.blueAccent,
                      onPressed: () => pushNewPage(WebRadioScreen(), context)),
                  FoiEtVeriteViewCard(
                      iconCard: LineIcons.youtube_play,
                      labelCard: "Youtube",
                      colorCard: Colors.red,
                      onPressed: () =>
                          pushNewPage(YoutubeViewScreen(), context)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

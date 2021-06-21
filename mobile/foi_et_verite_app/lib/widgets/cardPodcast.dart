import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CardPodcast extends StatelessWidget {
  final String titrePodcast;
  final String linkPodcast;
  const CardPodcast({Key key, this.titrePodcast, this.linkPodcast})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(4.5),
        child: ListTile(
          title: Text(titrePodcast),
          leading: CircleAvatar(
              radius: 25.0,
              backgroundColor: Colors.red,
              child: Icon(Icons.mic, color: Colors.white)),
          onTap: () => launchUrl(linkPodcast),
        ),
      ),
    );
  }

  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Impossible de lancer l\'url $url';
    }
  }
}

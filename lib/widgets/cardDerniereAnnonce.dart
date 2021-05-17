import 'package:flutter/material.dart';

class CardDerniereAnnonce extends StatelessWidget {
  final String dateArticle;
  final String titreArticle;
  final String corpsArticle;
  final String auteur;
  final Function onPressed;

  const CardDerniereAnnonce(
      {Key key,
      this.onPressed,
      this.dateArticle,
      this.titreArticle,
      this.corpsArticle,
      this.auteur})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Publié le : $dateArticle",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                  title: Text(
                    "$titreArticle",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("\n\n$corpsArticle"),
                  trailing: Icon(Icons.auto_stories, size: 100.0)),
            ),
            ListTile(
              trailing: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "\n Par : $auteur \n \n",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Text("\n")
          ],
        ),
      ),
      onTap: onPressed,
    );
  }
}

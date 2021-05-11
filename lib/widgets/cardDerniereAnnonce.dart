import 'package:flutter/material.dart';

class CardDerniereAnnonce extends StatelessWidget {
  final Function onPressed;

  const CardDerniereAnnonce({Key key, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
          child: Card(
               child:  Container(
                height: 260.0,
                child: Column(
                  children: [
                    ListTile(
                      trailing: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("date article : 24 / 04 / 2021"),
                      ),
                    ),
                    ListTile(
                      title: Text("Titre Article Titre Article !!!"),
                      subtitle: Text("\n\nDescription\nmagna culpa ad proident nulla enim minim voluptate magna officia minim non ipsum. Enim voluptate fugiat deserunt quis occaecat. Sint velit sint mollit ea eu ipsum."),
                      trailing: Icon(Icons.auto_stories,size: 100.0)
                    ),
                    ListTile(
                      trailing: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("plus info"),
                      ),
                    ),
                  ],
                ),
              ),
             ),
             onTap: onPressed,
    );
  }
}
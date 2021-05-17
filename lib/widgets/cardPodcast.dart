import 'package:flutter/material.dart';

class CardPodcast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: ListTile(
          title: Text("Title Podcast"),
          subtitle: Text("3:24", style: TextStyle(color: Colors.grey)),
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.red,
            child: Icon(Icons.mic),
          ),
          // trailing: FloatingActionButton(
          // child: Icon(Icons.play_circle_fill_rounded), onPressed: () {}),
        ),
      ),
    );
  }
}

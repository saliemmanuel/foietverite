import 'package:flutter/material.dart';

class CardPodcast extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        child: ListTile(
          title: Slider(max: 100.0, min: 0.0, value: 12, onChanged: (val) {}),
          subtitle: Text("3:24", style: TextStyle(color: Colors.grey)),
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.red,
            child: Icon(Icons.play_circle_fill_rounded),
          ),
          // trailing: FloatingActionButton(
          // child: Icon(Icons.play_circle_fill_rounded), onPressed: () {}),
        ),
      ),
    );
  }
}

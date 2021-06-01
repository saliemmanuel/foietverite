import 'package:flutter/material.dart';

class CardNotification extends StatelessWidget {
  final String title;
  final Color color = Colors.black;
  const CardNotification({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
          title: Text(title), leading: Icon(Icons.notifications, color: color)),
    );
  }
}

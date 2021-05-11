import 'package:flutter/material.dart';

pushNewPage(Widget page, BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }));
}

pushNewPageRemoveUntil(Widget page, BuildContext context) {
  Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) {
    return page;
  }), (Route route) => false);
}

//une vide de la chaine yt
//https://www.youtube.com/watch?v=tH1yrVH33Uo&ab_channel=FoietV%C3%A9rit%C3%A9
//https://www.youtube.com/watch?v=rBimMrxFJf4&ab_channel=FoietV%C3%A9rit%C3%A9FoietV%C3%A9rit%C3%A9

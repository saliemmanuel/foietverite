import 'package:flutter/material.dart';
import 'package:foi_et_verite_2/utils/colorsApp.dart';

class CardYoutubeVideo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 255.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(8.0)),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 163.5,
                      child: Center(
                        child: CircleAvatar(
                          radius: 35.0,
                          backgroundColor: Colors.red,
                          child: Icon(Icons.play_arrow_rounded, size: 53.0),
                        ),
                      ),
                    ),
                    Container(
                      height: 90.5,
                      color: ColorsApp.primaryColors,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                        child: ListTile(
                          title: Text("Titre vidéo",
                              style: TextStyle(color: ColorsApp.textColors)),
                          subtitle: Text("description detaillé vidéo",
                              style: TextStyle(color: Colors.grey)),
                        ),
                      ),
                    )
                  ],
                ),
                Positioned(
                    left: 20.0,
                    top: 140.0,
                    child: Slider(
                        max: 990.0, min: 0.0, value: 100, onChanged: (val) {})),
                Positioned(
                  right: 5.0,
                  top: 10.0,
                  child: PopupMenuButton(
                    icon: Icon(Icons.more_vert, color: ColorsApp.primaryColors),
                    itemBuilder: (BuildContext context) =>
                        <PopupMenuEntry<String>>[
                      PopupMenuItem(
                        value: "Partager",
                        textStyle: TextStyle(color: Colors.black),
                        child: Text("Partager"),
                        enabled: true,
                      ),
                      PopupMenuItem(
                        value: "signaler",
                        textStyle: TextStyle(color: Colors.black),
                        child: Text("Signaler"),
                        enabled: true,
                      ),
                    ],
                    onSelected: (value) {},
                    tooltip: "Plus de detail",
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

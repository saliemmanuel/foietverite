import 'package:flutter/material.dart';
import 'package:foi_et_verite_2/utils/colorsApp.dart';

class CardWebRadio extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _value = 0.0;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 205.0,
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12.0)),
            child: Stack(
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 113.5,
                      ),
                      Container(
                        height: 90.5,
                        color: ColorsApp.primaryColors,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                          child: Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, top: 10.0),
                            child: ListTile(
                              title: Text("Titre Web radio",
                                  style:
                                      TextStyle(color: ColorsApp.textColors)),
                              subtitle: Text(
                                "description web radio",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]),
                Positioned(
                    left: 10,
                    top: 88.0,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 29.0,
                          backgroundColor: Colors.pink,
                          child: Icon(Icons.play_arrow_rounded),
                        ),
                        Slider(
                            max: 100.0,
                            min: 0.0,
                            value: _value,
                            onChanged: (val) {
                              _value = val;
                            })
                      ],
                    )),
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

import 'package:flutter/material.dart';
import 'package:foi_et_verite_2/utils/colorsApp.dart';

class FoiEtVeriteViewCard extends StatelessWidget {
  final Function onPressed;
  final IconData iconCard;
  final String labelCard;
  final Color colorCard;
  const FoiEtVeriteViewCard(
      {Key key, this.onPressed, this.iconCard, this.labelCard, this.colorCard})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 400.0,
        decoration: BoxDecoration(
          color: ColorsApp.primaryColors,
          borderRadius: BorderRadius.circular(12.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 15.0),
            Icon(iconCard, size: 75.0, color: colorCard),
            SizedBox(height: 10.0),
            Text(labelCard, style: TextStyle(color: colorCard)),
            SizedBox(height: 30.0)
          ],
        ),
      ),
      onTap: onPressed,
    );
  }
}

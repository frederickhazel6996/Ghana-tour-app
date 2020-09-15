import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghana_tour/extras/resource.dart';

import 'package:ghana_tour/pages/all_heritage.dart';
import 'package:ghana_tour/pages/all_hotels.dart';

import 'package:ghana_tour/pages/all_transport.dart';

import 'package:ghana_tour/pages/food_drinks.dart';
import 'package:ghana_tour/pages/funFacts.dart';

import 'package:ghana_tour/pages/help.dart';

import 'package:ghana_tour/pages/hotel_region.dart';

import 'package:ghana_tour/pages/map.dart';

class Toppanel extends StatelessWidget {
  const Toppanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 1.5),
        children: <Widget>[
          ExtraPanel(
              text: "Transport",
              panelColor: ghanaExtra2,
              textColor: ghanaMain,
              icons: FontAwesomeIcons.car,
              function: 0),
          ExtraPanel(
              text: "Map",
              function: 1,
              panelColor: ghanaExtra2,
              textColor: ghanaMain,
              icons: FontAwesomeIcons.map),
          ExtraPanel(
              text: "Hotels",
              function: 2,
              panelColor: ghanaExtra2,
              textColor: ghanaMain,
              icons: FontAwesomeIcons.bed),
          ExtraPanel(
              text: "Tribes",
              function: 3,
              panelColor: ghanaExtra2,
              textColor: ghanaMain,
              icons: FontAwesomeIcons.users),
          ExtraPanel(
              text: "Fun facts",
              function: 4,
              panelColor: ghanaExtra2,
              textColor: ghanaMain,
              icons: FontAwesomeIcons.smileWink),
          ExtraPanel(
              text: "Extra",
              function: 5,
              panelColor: ghanaExtra2,
              textColor: ghanaMain,
              icons: FontAwesomeIcons.infoCircle),
        ],
      ),
    );
  }
}

class ExtraPanel extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final IconData icons;
  final int function;
  final String text;

  const ExtraPanel(
      {Key key,
      this.panelColor,
      this.textColor,
      this.text,
      this.icons,
      this.function})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var pagePush = [
      '/alltransport',
      '/map',
      '/allhotels',
      '/alltribes',
      '/funfacts',
      '/help'
    ];
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => {
        Navigator.pushNamed(
          context,
          pagePush[function],
        )
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: panelColor,
        ),
        margin: EdgeInsets.all(5),
        height: 0,
        width: width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icons,
              color: textColor,
            ),
            Text(text, style: TextStyle(color: textColor, fontSize: 13))
          ],
        ),
      ),
    );
  }
}

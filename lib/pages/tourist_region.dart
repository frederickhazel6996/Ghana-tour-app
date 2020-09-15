import 'package:flutter/material.dart';
import 'package:ghana_tour/extras/resource.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

Map info = {
  "region": "Central Region",
  "image_url": "assets/images/o.jpg",
  "regional_capital": "Cape Coast",
  "hotels": [
    {
      "name": "Cape Coast Castle",
      "image_url": "assets/images/castle.jpg",
      "pricing": "50",
      "rating": "4.5",
      "location": "Cape Coast"
    },
    {
      "name": "Elmina Castle",
      "image_url": "assets/images/castle.jpg",
      "pricing": "50",
      "rating": "4",
      "location": "Elmina"
    },
  ]
};

class TouristRegion extends StatefulWidget {
  TouristRegion({Key key}) : super(key: key);

  @override
  _TouristRegionState createState() => _TouristRegionState();
}

class _TouristRegionState extends State<TouristRegion> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                RegionImage(
                  images: [info["image_url"]],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                  child: SafeArea(
                      child: SingleChildScrollView(
                          child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: info["hotels"].length,
                        itemBuilder: (BuildContext contex, int index) {
                          return Container(
                              width: width,
                              margin: EdgeInsets.symmetric(vertical: 15.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: (width / 3) + 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(info["hotels"]
                                              [index]["image_url"]),
                                          fit: BoxFit.fill),
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          topLeft: Radius.circular(15)),
                                    ),
                                    height: 120,
                                  ),
                                  Container(
                                    width: (width / 3),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.grey[100],
                                            width: 0.5),
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(15),
                                            topRight: Radius.circular(15)),
                                        color: Colors.white),
                                    height: 120,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 10, 0, 0)),
                                        Icon(
                                          FontAwesomeIcons.hotel,
                                          color: ghanaExtra,
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        RatingBar(
                                          initialRating: double.parse(
                                              info["hotels"][index]["rating"]),
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 20,
                                          itemPadding: EdgeInsets.symmetric(
                                              horizontal: 0.5),
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                        SizedBox(
                                          height: 10.0,
                                        ),
                                        Text(
                                          info["hotels"][index]["name"],
                                          style: TextStyle(
                                              color: ghanaMain,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(
                                          height: 5.0,
                                        ),
                                        Text(
                                          info["hotels"][index]["location"],
                                          style: TextStyle(
                                              color: ghanaMain,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        SizedBox(height: 5),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        },
                      ),
                    ],
                  ))),
                ),
              ],
            ),
          )),
    );
  }
}

class RegionImage extends StatelessWidget {
  final List<String> images;

  const RegionImage({Key key, this.images}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      child: Container(
          width: width,
          height: 250,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(images[0]), fit: BoxFit.fill),
          )),
    );
  }
}

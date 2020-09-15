import 'package:flutter/material.dart';
import 'package:ghana_tour/extras/resource.dart';
import 'package:ghana_tour/pages/hotels_resorts.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:progress_indicators/progress_indicators.dart';

class HotelRegion extends StatefulWidget {
  final String choose;
  HotelRegion({Key key, this.choose}) : super(key: key);

  @override
  _HotelRegionState createState() => _HotelRegionState();
}

class _HotelRegionState extends State<HotelRegion> {
  Map hotelData;
  var queryParams = {"choose": 1};

  Future fetchHotelData() async {
    http.Response response = await http.get(
      'https://ghana-tour-server.herokuapp.com/api/hotels?choose=${widget.choose}',
    );

    setState(() {
      hotelData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchHotelData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: hotelData == null
          ? Center(
              child: JumpingDotsProgressIndicator(
                fontSize: 120.0,
                color: ghanaMain,
              ),
            )
          : SafeArea(
              top: false,
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    RegionImage(
                      images: [hotelData["image_url"]],
                      regionName: hotelData["region"],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 25),
                      child: SafeArea(
                          child: SingleChildScrollView(
                              child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: hotelData["hotels"].length,
                            itemBuilder: (BuildContext contex, int index) {
                              return GestureDetector(
                                onTap: () => {
                                  Navigator.pushNamed(context, '/hotel',
                                      arguments: hotelData["hotels"][index])
                                },
                                child: Container(
                                    width: width,
                                    margin:
                                        EdgeInsets.symmetric(vertical: 15.0),
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: (width / 3) + 50,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    hotelData["hotels"][index]
                                                        ["image_url"]),
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
                                                  bottomRight:
                                                      Radius.circular(15),
                                                  topRight:
                                                      Radius.circular(15)),
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
                                                    hotelData["hotels"][index]
                                                        ["rating"]),
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize: 20,
                                                itemPadding:
                                                    EdgeInsets.symmetric(
                                                        horizontal: 0.5),
                                                itemBuilder: (context, _) =>
                                                    Icon(
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
                                                hotelData["hotels"][index]
                                                    ["short_name"],
                                                style: TextStyle(
                                                    color: ghanaMain,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                height: 5.0,
                                              ),
                                              Text(
                                                hotelData["hotels"][index]
                                                    ["place"],
                                                style: TextStyle(
                                                    color: ghanaMain,
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(height: 5),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )),
                              );
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
  final String regionName;

  const RegionImage({Key key, this.images, this.regionName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 150, 0, 10),
                child: Text(
                  regionName + " Region",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
              Icon(
                FontAwesomeIcons.hotel,
                color: Colors.white,
              ),
            ],
          ),
          width: width,
          height: 250,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(images[0]), fit: BoxFit.fill),
          )),
    );
  }
}

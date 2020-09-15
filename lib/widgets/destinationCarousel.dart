import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghana_tour/extras/resource.dart';
import 'package:ghana_tour/models/region_model.dart';

class DestinationCarousel extends StatelessWidget {
  const DestinationCarousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Top Locations",
              style: TextStyle(
                  color: ghanaMain, fontWeight: FontWeight.w400, fontSize: 22),
            ),
            GestureDetector(
              onTap: () => print("print all destinations"),
              child: Text(
                "See All",
                style: TextStyle(
                    color: ghanaMain,
                    fontWeight: FontWeight.bold,
                    fontSize: 13),
              ),
            )
          ],
        ),
        SizedBox(height: 10),
        Container(
          height: 260,
          /*   color: Colors.green[100], */
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: regions.length,
              itemBuilder: (BuildContext context, int index) {
                Region currentRegion = regions[index];
                return Container(
                  // color: Colors.red[600],
                  margin: EdgeInsets.all(10.0),
                  width: width / 2,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: <Widget>[
                      Positioned(
                        bottom: 30.0,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          height: 120,
                          width: (width / 2) - 10,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text("120 attractions",
                                    style: TextStyle(
                                        color: ghanaMain,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13)),
                                Text(currentRegion.description,
                                    style: TextStyle(
                                        color: ghanaMain,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 13))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0.0, 2.0),
                                blurRadius: 6.0)
                          ],
                          color: Colors.grey[100],
                        ),
                        child: Stack(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image(
                                height: 150,
                                width: 150,
                                image: AssetImage(currentRegion.imageUrl),
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              left: 10.0,
                              bottom: 10.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Icon(
                                        FontAwesomeIcons.city,
                                        color: Colors.white,
                                        size: 8,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(currentRegion.city,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: 13)),
                                    ],
                                  ),
                                  Text(currentRegion.region,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13))
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                );
              }),
        )
      ],
    );
  }
}

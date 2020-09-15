import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghana_tour/extras/resource.dart';
import 'package:ghana_tour/models/hotels.dart';
import 'package:ghana_tour/pages/all_hotels.dart';
import 'package:ghana_tour/pages/hotels_resorts.dart';

class HotelCarousel extends StatelessWidget {
  const HotelCarousel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Popular Hotels",
              style: TextStyle(
                  color: ghanaMain, fontWeight: FontWeight.w400, fontSize: 22),
            ),
            GestureDetector(
              onTap: () => {
                Navigator.pushNamed(
                  context,
                  '/allhotels',
                )
              },
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
              itemCount: hotels.length,
              itemBuilder: (BuildContext context, int index) {
                Hotel currentHotel = hotels[index];
                return GestureDetector(
                  onTap: () => {
                    Navigator.pushNamed(context, '/hotel',
                        arguments: currentHotel.hotelData)
                  },
                  child: Container(
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
                                  Text("GHC " + currentHotel.price.toString(),
                                      style: TextStyle(
                                          color: ghanaMain,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 13)),
                                  Text(currentHotel.address,
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
                                  image: NetworkImage(currentHotel.imageUrl),
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
                                          FontAwesomeIcons.hotel,
                                          color: Colors.white,
                                          size: 8,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(currentHotel.name,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 13)),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}

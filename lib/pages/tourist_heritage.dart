import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ghana_tour/extras/resource.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ghana_tour/widgets/extramap.dart';

class TouristHeritage extends StatefulWidget {
  TouristHeritage({Key key}) : super(key: key);

  @override
  _TouristHeritageState createState() => _TouristHeritageState();
}

Map touristData = {
  "name": "Elmina Castle",
  "image_url": "assets/images/castle.jpg",
  "pricing": "50",
  "rating": "4",
  "location": "Elmina",
  "website_url": "www.goal.com",
  "about": "It is a nice place",
  "lat": 5.0847,
  "lon": -1.35093
};

class _TouristHeritageState extends State<TouristHeritage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          top: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                HotelCarousel(
                  images: [touristData["image_url"]],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(touristData["name"],
                          style: TextStyle(
                              color: ghanaMain,
                              fontWeight: FontWeight.w400,
                              fontSize: 24)),
                      RatingBar(
                        initialRating: double.parse(touristData["rating"]),
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 20,
                        itemPadding: EdgeInsets.symmetric(horizontal: 0.5),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(touristData["about"],
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 15)),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Text("Rate",
                          style: TextStyle(
                              color: ghanaMain,
                              fontWeight: FontWeight.w400,
                              fontSize: 18)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      FontAwesomeIcons.arrowRight,
                      color: ghanaExtra,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Row(
                      children: [
                        Text("GHC " + touristData["pricing"] + "+",
                            style: TextStyle(
                                color: ghanaMain,
                                fontWeight: FontWeight.w600,
                                fontSize: 18)),
                        Text("   (rates are subject to Change)",
                            style: TextStyle(
                                color: ghanaMain,
                                fontWeight: FontWeight.w400,
                                fontSize: 10))
                      ],
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Text("Location",
                          style: TextStyle(
                              color: ghanaMain,
                              fontWeight: FontWeight.w400,
                              fontSize: 18)),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Icon(
                      FontAwesomeIcons.arrowRight,
                      color: ghanaExtra,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(touristData["location"],
                        style: TextStyle(
                            color: ghanaMain,
                            fontWeight: FontWeight.w600,
                            fontSize: 18))
                  ],
                ),
                SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    child: ExtraMap(
                      lat: touristData["lat"],
                      lon: touristData["lon"],
                    ),
                    height: 150,
                    width: width,
                    color: ghanaMain,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: Text("Gallery",
                      style: TextStyle(
                          color: ghanaMain,
                          fontWeight: FontWeight.w400,
                          fontSize: 20)),
                ),
                StaggeredGrid(),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Container(
                    height: 50.0,
                    child: FlatButton(
                      onPressed: () => {launch(touristData["websiteUrl"])},
                      color: ghanaMain,
                      child: Center(
                        child: Text("Save Location",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                )
              ],
            ),
          )),
    );
  }
}

final List<String> im = [
  "assets/images/a.jpg",
  "assets/images/a.jpg",
  "assets/images/a.jpg",
  "assets/images/c.jpg"
];

class StaggeredGrid extends StatelessWidget {
  const StaggeredGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
      child: Container(
          width: width,
          height: 250,
          child: new StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            physics: NeverScrollableScrollPhysics(),
            itemCount: im.length,
            itemBuilder: (BuildContext context, int index) => new Container(
                decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(im[index]), fit: BoxFit.cover),
            )),
            staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(2, index.isEven ? 2 : 1),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
          )),
    );
  }
}

class HotelCarousel extends StatelessWidget {
  final List<String> images;

  const HotelCarousel({Key key, this.images}) : super(key: key);
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

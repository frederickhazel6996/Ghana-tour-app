import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ghana_tour/extras/resource.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Transport extends StatelessWidget {
  final Map transport;
  const Transport({Key key, this.transport}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: ghanaSecondary,
          elevation: 0,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TransportCarousel(
              images: [transport["image_url"]],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(transport["name"],
                      style: TextStyle(
                          color: ghanaMain,
                          fontWeight: FontWeight.w400,
                          fontSize: 24)),
                  RatingBar(
                    initialRating: double.parse(transport["ratings"]),
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
              child: Text(transport["about"],
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 15)),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: Text("Local Routes",
                  style: TextStyle(
                      color: ghanaMain,
                      fontWeight: FontWeight.w400,
                      fontSize: 20)),
            ),
            SizedBox(height: 10),
            Destinations(
              destinations: transport["local_routes"],
              type: transport["type"],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: Text("International Routes",
                  style: TextStyle(
                      color: ghanaMain,
                      fontWeight: FontWeight.w400,
                      fontSize: 20)),
            ),
            SizedBox(height: 10),
            Destinations(
              destinations: transport["international_routes"],
              type: transport["type"],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
              child: Text("Photos",
                  style: TextStyle(
                      color: ghanaMain,
                      fontWeight: FontWeight.w400,
                      fontSize: 20)),
            ),
            SizedBox(
              height: 20,
            ),
            StaggeredGrid(),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Container(
                height: 50.0,
                child: FlatButton(
                  onPressed: () => {launch(transport["websiteUrl"])},
                  color: ghanaMain,
                  child: Center(
                    child: Text("Visit Website",
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

class TransportCarousel extends StatelessWidget {
  final List images;

  const TransportCarousel({Key key, this.images}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      child: Container(
          width: width,
          height: 250,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(images[0]), fit: BoxFit.fill),
          )),
    );
  }
}

final List<String> im = [
  "assets/images/a.jpg",
  "assets/images/e.jpg",
  "assets/images/c.jpg",
  "assets/images/d.jpg"
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

class Destinations extends StatelessWidget {
  final List destinations;
  final String type;

  const Destinations({Key key, this.destinations, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: destinations.length,
        itemBuilder: (BuildContext contex, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
            child: destinations.isNotEmpty
                ? Row(
                    children: <Widget>[
                      type == "bus"
                          ? Icon(
                              FontAwesomeIcons.bus,
                              color: ghanaExtra,
                            )
                          : type == "car"
                              ? Icon(
                                  FontAwesomeIcons.car,
                                  color: ghanaExtra,
                                )
                              : Icon(
                                  FontAwesomeIcons.planeDeparture,
                                  color: ghanaExtra,
                                ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(destinations[index])
                    ],
                  )
                : Text("none"),
          );
        });
  }
}

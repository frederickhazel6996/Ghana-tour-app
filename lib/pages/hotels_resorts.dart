import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ghana_tour/extras/resource.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ghana_tour/widgets/extramap.dart';

class HotelResort extends StatefulWidget {
  final Map hotelData;
  HotelResort({Key key, this.hotelData}) : super(key: key);

  @override
  _HotelResortState createState() => _HotelResortState();
}

class _HotelResortState extends State<HotelResort> {
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
                  images: [widget.hotelData["image_url"]],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.hotelData["short_name"] + " hotel",
                          style: TextStyle(
                              color: ghanaMain,
                              fontWeight: FontWeight.w400,
                              fontSize: 22)),
                      RatingBar(
                        initialRating: double.parse(widget.hotelData["rating"]),
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
                  child: Text("Amenities",
                      style: TextStyle(
                          color: ghanaMain,
                          fontWeight: FontWeight.w400,
                          fontSize: 18)),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Amenities(
                  amenities: widget.hotelData['amenities'],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Icon(
                        FontAwesomeIcons.coins,
                        size: 15,
                        color: ghanaExtra,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Rate :",
                        style: TextStyle(
                            color: ghanaMain,
                            fontWeight: FontWeight.w400,
                            fontSize: 18)),
                    SizedBox(
                      width: 5,
                    ),
                    widget.hotelData["pricing"] == 0
                        ? Row(
                            children: [
                              Text("check website or call",
                                  style: TextStyle(
                                      color: ghanaMain,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18)),
                            ],
                          )
                        : Row(
                            children: [
                              Text(
                                  "GHC " +
                                      widget.hotelData["pricing"].toString() +
                                      "+",
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
                      child: Icon(
                        FontAwesomeIcons.locationArrow,
                        color: ghanaExtra,
                        size: 15,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Location :",
                        style: TextStyle(
                            color: ghanaMain,
                            fontWeight: FontWeight.w400,
                            fontSize: 18)),
                    SizedBox(
                      width: 5,
                    ),
                    Text(widget.hotelData["place"],
                        style: TextStyle(
                            color: ghanaMain,
                            fontWeight: FontWeight.w600,
                            fontSize: 18))
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Icon(
                        FontAwesomeIcons.phone,
                        color: ghanaExtra,
                        size: 15,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Contact :",
                        style: TextStyle(
                            color: ghanaMain,
                            fontWeight: FontWeight.w400,
                            fontSize: 18)),
                    SizedBox(
                      width: 5,
                    ),
                    Text(widget.hotelData["contact"],
                        style: TextStyle(
                            color: ghanaMain,
                            fontWeight: FontWeight.w600,
                            fontSize: 18))
                  ],
                ),
                SizedBox(height: 30.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    child: ExtraMap(
                      lat: widget.hotelData["lat"],
                      lon: widget.hotelData["lon"],
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
                StaggeredGrid(
                  im: [
                    widget.hotelData["extra_image_url"],
                    widget.hotelData["extra1_image_url"],
                    widget.hotelData["extra2_image_url"],
                    widget.hotelData["image_url"]
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                widget.hotelData["website_url"] == 0
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                        child: Container(
                          height: 50.0,
                          child: FlatButton(
                            onPressed: () =>
                                {launch(widget.hotelData["websiteUrl"])},
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

class StaggeredGrid extends StatelessWidget {
  final List<String> im;
  const StaggeredGrid({Key key, this.im}) : super(key: key);

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
                  image: NetworkImage(im[index]), fit: BoxFit.cover),
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
            image: DecorationImage(
                image: NetworkImage(images[0]), fit: BoxFit.fill),
          )),
    );
  }
}

class Amenities extends StatelessWidget {
  final List amenities;
  final String type;

  const Amenities({Key key, this.amenities, this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(0),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: amenities.length,
        itemBuilder: (BuildContext contex, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
            child: Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.mapMarker,
                  color: ghanaExtra,
                  size: 15,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(amenities[index])
              ],
            ),
          );
        });
  }
}

import 'package:flutter/material.dart';
import 'package:ghana_tour/extras/resource.dart';
import 'package:ghana_tour/widgets/extramap.dart';
import 'package:photo_view/photo_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Festival extends StatelessWidget {
  final Map festival;

  const Festival({Key key, this.festival}) : super(key: key);

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
                FestivalCarousel(
                  images: [festival["image_url"]],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(festival["name"] + " Festival",
                      style: TextStyle(
                          color: ghanaMain,
                          fontWeight: FontWeight.w400,
                          fontSize: 24)),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(festival["about"],
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
                      child: Icon(
                        FontAwesomeIcons.locationArrow,
                        color: ghanaExtra,
                        size: 15,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Location : ",
                        style: TextStyle(
                            color: ghanaMain,
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                    Text(festival["place"],
                        style: TextStyle(
                            color: ghanaMain,
                            fontWeight: FontWeight.w400,
                            fontSize: 18))
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Icon(
                        FontAwesomeIcons.users,
                        color: ghanaExtra,
                        size: 15,
                      ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Text("Tribe : ",
                        style: TextStyle(
                            color: ghanaMain,
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                    Text(festival["tribe"],
                        style: TextStyle(
                            color: ghanaMain,
                            fontWeight: FontWeight.w400,
                            fontSize: 18))
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Icon(
                        FontAwesomeIcons.calendarDay,
                        color: ghanaExtra,
                        size: 15,
                      ),
                    ),
                    SizedBox(
                      width: 7.0,
                    ),
                    Text("Dates ",
                        style: TextStyle(
                            color: ghanaMain,
                            fontWeight: FontWeight.w600,
                            fontSize: 18)),
                  ],
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: Text(festival["dates"],
                      style: TextStyle(
                          color: ghanaMain,
                          fontWeight: FontWeight.w400,
                          fontSize: 18)),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    child: ExtraMap(
                      extraname: festival["place"],
                      lat: festival["lat"],
                      lon: festival["lon"],
                    ),
                    height: 150,
                    width: width,
                    color: ghanaMain,
                  ),
                ),
                SizedBox(height: 15),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                      child: Text("Gallery",
                          style: TextStyle(
                              color: ghanaMain,
                              fontWeight: FontWeight.w600,
                              fontSize: 18)),
                    ),
                  ],
                ),
                StaggeredGrid(),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Container(
                    height: 50.0,
                    color: ghanaMain,
                    child: Center(
                      child: Text("Save Event",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20)),
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

class FestivalCarousel extends StatelessWidget {
  final List<String> images;

  const FestivalCarousel({Key key, this.images}) : super(key: key);
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

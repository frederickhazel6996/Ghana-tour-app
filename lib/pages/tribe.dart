import 'package:flutter/material.dart';
import 'package:ghana_tour/extras/resource.dart';

import 'package:photo_view/photo_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Tribe extends StatelessWidget {
  final Map tribe;

  const Tribe({Key key, this.tribe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
            TribeCarousel(
              images: [tribe["image_url"]],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(tribe["name"],
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
              child: Text(tribe["history"],
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
              child: Text("Subgroups",
                  style: TextStyle(
                      color: ghanaMain,
                      fontWeight: FontWeight.w400,
                      fontSize: 20)),
            ),
            SizedBox(height: 10),
            Subgroups(subgroups: tribe["subgroups"]),
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
            StaggeredGrid(
              im: [
                tribe["image_url"],
                tribe["image_url"],
                tribe["image_url"],
                tribe["image_url"]
              ],
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

class TribeCarousel extends StatelessWidget {
  final List images;

  const TribeCarousel({Key key, this.images}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      child: Container(
          width: width,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            image: DecorationImage(
                image: NetworkImage(images[0]), fit: BoxFit.fill),
          )),
    );
  }
}

class StaggeredGrid extends StatelessWidget {
  final List im;
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

class Subgroups extends StatelessWidget {
  final List subgroups;

  const Subgroups({Key key, this.subgroups}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: subgroups.length,
        itemBuilder: (BuildContext contex, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
            child: Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.userFriends,
                  color: ghanaExtra,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(subgroups[index])
              ],
            ),
          );
        });
  }
}

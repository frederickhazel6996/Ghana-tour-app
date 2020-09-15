import 'package:flutter/material.dart';
import 'package:ghana_tour/extras/resource.dart';

import 'package:photo_view/photo_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Food extends StatelessWidget {
  final Map food;

  const Food({Key key, this.food}) : super(key: key);

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
            FoodCarousel(
              images: [food["image_url"]],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(food["name"],
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
              child: Text(food["about"],
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
              child: Text("Ingredients",
                  style: TextStyle(
                      color: ghanaMain,
                      fontWeight: FontWeight.w400,
                      fontSize: 20)),
            ),
            SizedBox(height: 10),
            Ingredients(ingredients: food["ingredients"]),
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
                food["image_url"],
                food["extraImage1"],
                food["extraImage2"],
                food["extraImage3"]
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
              child: Container(
                height: 50.0,
                color: ghanaMain,
                child: Center(
                  child: Text("Save Food",
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

class FoodCarousel extends StatelessWidget {
  final List images;

  const FoodCarousel({Key key, this.images}) : super(key: key);
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

class Ingredients extends StatelessWidget {
  final List ingredients;

  const Ingredients({Key key, this.ingredients}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: ingredients.length,
        itemBuilder: (BuildContext contex, int index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
            child: Row(
              children: <Widget>[
                Icon(
                  FontAwesomeIcons.pepperHot,
                  color: ghanaExtra,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(ingredients[index])
              ],
            ),
          );
        });
  }
}

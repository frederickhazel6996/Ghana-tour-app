import 'package:flutter/material.dart';
import 'package:ghana_tour/extras/resource.dart';
import 'package:ghana_tour/pages/food.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FoodandDrinks extends StatefulWidget {
  FoodandDrinks({Key key}) : super(key: key);

  @override
  _FoodandDrinksState createState() => _FoodandDrinksState();
}

class _FoodandDrinksState extends State<FoodandDrinks> {
  List foodData;

  Future fetchFoodData() async {
    http.Response response =
        await http.get("https://ghana-tour-server.herokuapp.com/api/food");

    setState(() {
      foodData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchFoodData();
    super.initState();
  }

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
      body: foodData == null
          ? Center(
              child: JumpingDotsProgressIndicator(
                fontSize: 120.0,
                color: ghanaMain,
              ),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 25),
              child: SafeArea(
                  child: SingleChildScrollView(
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Foods and Drinks",
                    style: TextStyle(
                        color: ghanaMain,
                        fontWeight: FontWeight.w400,
                        fontSize: 22),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: foodData.length,
                    itemBuilder: (BuildContext contex, int index) {
                      return GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, '/food',
                              arguments: foodData[index]["food_extra"])
                        },
                        child: Container(
                            width: width,
                            margin: EdgeInsets.symmetric(vertical: 15.0),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  width: (width / 3) + 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    image: DecorationImage(
                                        image: NetworkImage(
                                            foodData[index]["image_url"]),
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
                                          color: Colors.grey[100], width: 0.5),
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
                                          padding:
                                              EdgeInsets.fromLTRB(0, 30, 0, 0)),
                                      Icon(
                                        FontAwesomeIcons.utensils,
                                        color: ghanaExtra,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        foodData[index]["name"],
                                        style: TextStyle(
                                            color: ghanaMain,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
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
    );
  }
}

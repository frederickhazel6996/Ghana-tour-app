import "package:flutter/material.dart";
import 'package:ghana_tour/extras/resource.dart';
import 'package:ghana_tour/pages/tribe.dart';
import "package:http/http.dart" as http;
import 'dart:convert';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/services.dart';

class AllHeritage extends StatefulWidget {
  AllHeritage({Key key}) : super(key: key);

  @override
  _AllHeritageState createState() => _AllHeritageState();
}

class _AllHeritageState extends State<AllHeritage> {
  List heritageData;

  Future fetchtransportData() async {
    http.Response response =
        await http.get("https://ghana-tour-server.herokuapp.com/api/heritage");

    setState(() {
      heritageData = json.decode(response.body);
    });
  }

  @override
  void initState() {
    fetchtransportData();

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
      body: heritageData == null
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
                    "Tribes",
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
                    itemCount: heritageData.length,
                    itemBuilder: (BuildContext contex, int index) {
                      return GestureDetector(
                        onTap: () => {
                          Navigator.pushNamed(context, '/tribe',
                              arguments: heritageData[index])
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
                                            heritageData[index]["image_url"]),
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
                                        FontAwesomeIcons.users,
                                        color: ghanaExtra,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        heritageData[index]["name"],
                                        style: TextStyle(
                                            color: ghanaMain,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w600),
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
    );
  }
}

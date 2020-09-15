import 'package:flutter/material.dart';
import 'package:ghana_tour/extras/resource.dart';
import 'package:ghana_tour/panels/alllocationspanel.dart';
import 'package:flutter/services.dart';

class AllLocations extends StatelessWidget {
  const AllLocations({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "All Tourist Sites",
                  style: TextStyle(
                      color: ghanaMain,
                      fontWeight: FontWeight.w400,
                      fontSize: 22),
                ),
                SizedBox(height: 20),
                AllLocationsPanel(),
              ],
            ),
          ),
        )));
  }
}

class ExtraLocations extends StatelessWidget {
  const ExtraLocations({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "All Tourist Sites",
              style: TextStyle(
                  color: ghanaMain, fontWeight: FontWeight.w400, fontSize: 22),
            ),
            SizedBox(height: 20),
            AllLocationsPanel()
          ],
        ),
      ),
    ));
  }
}

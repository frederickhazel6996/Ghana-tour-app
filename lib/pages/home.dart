import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghana_tour/extras/resource.dart';
import 'package:ghana_tour/pages/all_festivals.dart';
import 'package:ghana_tour/pages/all_locations.dart';
import 'package:ghana_tour/pages/food.dart';
import 'package:ghana_tour/pages/food_drinks.dart';

import 'package:ghana_tour/panels/toppanel.dart';
import 'package:ghana_tour/widgets/carousel.dart';
import 'package:ghana_tour/widgets/destinationCarousel.dart';
import 'package:ghana_tour/widgets/hotelCarousel.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:progress_indicators/progress_indicators.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

SharedPreferences _appStorage;
String _firstName = '';

class _HomeState extends State<Home> {
  int currentIndex = 1;

  _retrieveData() async {
    _appStorage = await SharedPreferences.getInstance();
    String _temp = _appStorage.getString("firstName");

    setState(() {
      _firstName = _temp;
    });
  }

  /* @override
  void initState() {
    //_retrieveData();
    super.initState();
  } */

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List tab = [
      ExtraLocations(),
      _firstName == null
          ? Center(
              child: JumpingDotsProgressIndicator(
                fontSize: 120.0,
                color: ghanaMain,
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 45, horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Welcome to Ghana",
                      style: TextStyle(
                          color: ghanaMain,
                          fontWeight: FontWeight.w400,
                          fontSize: 22),
                    ),
                    SizedBox(height: 20),
                    Toppanel(),
                    SizedBox(height: 15),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.transparent,
                      ),
                      height: 200,
                      width: width,
                      child: Carousel(),
                    ),
                    SizedBox(height: 25),
                    DestinationCarousel(),
                    SizedBox(height: 0),
                    HotelCarousel(),
                    GestureDetector(
                      onTap: () => {
                        Navigator.pushNamed(
                          context,
                          '/allbeaches',
                        ),
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 150, 0, 0),
                        child: Text("Beaches and Resorts",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20)),
                        width: width,
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage("assets/images/o.jpg"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.pushNamed(
                          context,
                          '/allfood',
                        )
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 150, 0, 0),
                        child: Text("Food and Drinks",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20)),
                        width: width,
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage("assets/images/waakye.jpg"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () => {
                        Navigator.pushNamed(
                          context,
                          '/allfestivals',
                        )
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 150, 0, 0),
                        child: Text("Festivals",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 20)),
                        width: width,
                        height: 180,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage("assets/images/aboakyer.jpg"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  ],
                ),
              ),
            )),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: ghanaMain,
          elevation: 0,
        ),
      ),
      body: tab[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          elevation: 20.0,
          currentIndex: currentIndex,
          unselectedFontSize: 2,
          unselectedItemColor: Colors.grey[600],
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.locationArrow,
                  size: 20.0,
                ),
                title: Container()),
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.home,
                  size: 20.0,
                ),
                title: Container()),
          ]),
    );
  }
}

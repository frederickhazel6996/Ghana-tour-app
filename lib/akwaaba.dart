import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:ghana_tour/extras/resource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Akwaaba extends StatefulWidget {
  const Akwaaba({Key key}) : super(key: key);

  @override
  _AkwaabaState createState() => _AkwaabaState();
}

SharedPreferences _appStorage;
String _token;
bool test = false;

class _AkwaabaState extends State<Akwaaba> {
  _retrieveData() async {
    _appStorage = await SharedPreferences.getInstance();
    String _temp = _appStorage.getString("token");

    setState(() {
      _token = _temp;
    });
  }

  _checkToken() async {
    Future.delayed(const Duration(seconds: 3), () {
      if (_token == null || _token == '') {
        Navigator.pushNamedAndRemoveUntil(context, '/auth', (route) => false);
      } else {
        Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _retrieveData();
    _checkToken();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/images/o.jpg"), fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            /*  title: Text("Welcome to Ghana"), */
            centerTitle: true,
          ),
          body: SafeArea(
              child: Column(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 20.0),
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            Text("Welcome to Ghana",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20)),
                            Text("Enjoy the Wonderful Experience",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16))
                          ],
                        ),
                        width: width,
                        height: 300,
                        decoration: new BoxDecoration(
                            color: Colors.grey.shade200.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                  )),
              SizedBox(
                height: height - 500,
              ),
            ],
          )),
        ),
      ),
    );
  }
}

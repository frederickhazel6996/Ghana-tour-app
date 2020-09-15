import 'package:flutter/material.dart';

import 'package:ghana_tour/akwaaba.dart';
import 'package:ghana_tour/auth/authenticate.dart';

import 'package:ghana_tour/pages/home.dart';
import 'package:ghana_tour/routes/generator.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:
          ThemeData(fontFamily: "Quicksand", primaryColor: Colors.green[500]),
      home: Akwaaba(),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generatorRoute,
    ));
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   var token = prefs.getString('token');
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     theme: ThemeData(fontFamily: "Quicksand", primaryColor: Colors.green[500]),
//     home: token == null ? Authenticate() : Home(),
//     routes: {
//       '/home': (context) => Home(),
//       '/auth': (context) => Authenticate()
//     },
//   ));
// }

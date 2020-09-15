import 'package:flutter/material.dart';

import 'package:ghana_tour/akwaaba.dart';
import 'package:ghana_tour/auth/authenticate.dart';
import 'package:ghana_tour/pages/all_beaches.dart';

import 'package:ghana_tour/pages/all_festivals.dart';
import 'package:ghana_tour/pages/all_heritage.dart';
import 'package:ghana_tour/pages/all_hotels.dart';
import 'package:ghana_tour/pages/all_locations.dart';
import 'package:ghana_tour/pages/all_transport.dart';
import 'package:ghana_tour/pages/festival.dart';
import 'package:ghana_tour/pages/food.dart';
import 'package:ghana_tour/pages/food_drinks.dart';

import 'package:ghana_tour/pages/funFacts.dart';
import 'package:ghana_tour/pages/help.dart';
import 'package:ghana_tour/pages/home.dart';
import 'package:ghana_tour/pages/hotel_region.dart';
import 'package:ghana_tour/pages/hotels_resorts.dart';

import 'package:ghana_tour/pages/map.dart';

import 'package:ghana_tour/pages/tourist_heritage.dart';
import 'package:ghana_tour/pages/tourist_region.dart';
import 'package:ghana_tour/pages/transport.dart';
import 'package:ghana_tour/pages/tribe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RouteGenerator {
  // ignore: missing_return
  static Route<dynamic> generatorRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => Home());
      case '/home':
        return MaterialPageRoute(builder: (_) => Home());
      case '/map':
        return MaterialPageRoute(builder: (_) => GhanaMap());
      case '/alltransport':
        return MaterialPageRoute(builder: (_) => AllTransport());
      case '/allbeaches':
        return MaterialPageRoute(builder: (_) => AllBeaches());
      case '/transport':
        return MaterialPageRoute(
            builder: (_) => Transport(
                  transport: args,
                ));
      case '/tribe':
        return MaterialPageRoute(
            builder: (_) => Tribe(
                  tribe: args,
                ));
      case '/allfestivals':
        return MaterialPageRoute(builder: (_) => Allfestivals());
      case '/alltribes':
        return MaterialPageRoute(builder: (_) => AllHeritage());
      case '/alllocations':
        return MaterialPageRoute(builder: (_) => AllLocations());
      case '/funfacts':
        return MaterialPageRoute(builder: (_) => FunFacts());
      case '/help':
        return MaterialPageRoute(builder: (_) => Help());
      case '/hotelregion':
        return MaterialPageRoute(builder: (_) => HotelRegion(choose: args));
      case '/allhotels':
        return MaterialPageRoute(builder: (_) => AllHotels());
      case '/allfood':
        return MaterialPageRoute(builder: (_) => FoodandDrinks());
      case '/food':
        return MaterialPageRoute(
            builder: (_) => Food(
                  food: args,
                ));
      case '/hotel':
        return MaterialPageRoute(
            builder: (_) => HotelResort(
                  hotelData: args,
                ));
      case '/festival':
        return MaterialPageRoute(
            builder: (_) => Festival(
                  festival: args,
                ));
    }
  }
}

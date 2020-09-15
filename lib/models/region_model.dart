import 'package:ghana_tour/models/attraction_model.dart';

class Region {
  String imageUrl;
  String city;
  String region;
  String description;
  List<Attraction> attractions;

  Region({
    this.imageUrl,
    this.city,
    this.region,
    this.description,
    this.attractions,
  });
}

List<Attraction> attractions = [
  Attraction(
    imageUrl: 'assets/images/stmarksbasilica.jpg',
    name: 'St. Mark\'s Basilica',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Attraction(
    imageUrl: 'assets/images/gondola.jpg',
    name: 'Walking Tour and Gonadola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 pm'],
    rating: 4,
    price: 210,
  ),
  Attraction(
    imageUrl: 'assets/images/murano.jpg',
    name: 'Murano and Burano Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];

List<Region> regions = [
  Region(
    imageUrl: 'assets/images/o.jpg',
    city: 'Cape Coast',
    region: 'Central Region',
    description: 'Coastal Area',
    attractions: attractions,
  ),
  Region(
    imageUrl: 'assets/images/a.jpg',
    city: 'Takoradi',
    region: 'Western Region',
    description: 'Oil City',
    attractions: attractions,
  ),
  Region(
    imageUrl: 'assets/images/b.jpg',
    city: 'Accra',
    region: 'Greater Accra Region',
    description: 'Capital City',
    attractions: attractions,
  ),
  Region(
    imageUrl: 'assets/images/o.jpg',
    city: 'Tamale',
    region: 'Northern Region',
    description: 'Kings of the North',
    attractions: attractions,
  ),
];

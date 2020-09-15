class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;
  Map hotelData;

  Hotel({this.imageUrl, this.name, this.address, this.price, this.hotelData});
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl:
        'https://drake6996.s3.us-east-2.amazonaws.com/ghana_tour/hotels/kempinski/a.JPG',
    name: 'Kempinski Hotel',
    address: 'Accra',
    price: 1661,
    hotelData: {
      "name": 'Kempinski Hotel Gold Coast City',
      "image_url":
          'https://drake6996.s3.us-east-2.amazonaws.com/ghana_tour/hotels/kempinski/a.JPG',
      "extra_image_url":
          'https://drake6996.s3.us-east-2.amazonaws.com/ghana_tour/hotels/kempinski/b.JPG',
      "extra1_image_url":
          'https://drake6996.s3.us-east-2.amazonaws.com/ghana_tour/hotels/kempinski/c.JPG',
      "extra2_image_url":
          'https://drake6996.s3.us-east-2.amazonaws.com/ghana_tour/hotels/kempinski/d.JPG',
      "short_name": 'kempinski',
      "place": 'Accra',
      "address": 'Ministries PMB, 66 Gamel Abdul Naseer Ave, Accra',
      "lat": 5.55439,
      "lon": -0.198433,
      "pricing": 1661,
      "rating": '5',
      "contact": '024 243 6000',
      "Website_url": 'www.kempinski.com',
      "amenities": ['pool', 'spa', 'free wifi']
    },
  ),
  Hotel(
    imageUrl:
        'https://drake6996.s3.us-east-2.amazonaws.com/ghana_tour/hotels/senchi/a.JPG',
    name: 'The Royal Senchi ',
    address: 'Akosombo',
    price: 940,
    hotelData: {
      "name": 'The Royal Senchi',
      "image_url":
          'https://drake6996.s3.us-east-2.amazonaws.com/ghana_tour/hotels/senchi/a.JPG',
      "extra_image_url":
          'https://drake6996.s3.us-east-2.amazonaws.com/ghana_tour/hotels/senchi/b.JPG',
      "extra1_image_url":
          'https://drake6996.s3.us-east-2.amazonaws.com/ghana_tour/hotels/senchi/c.JPG',
      "extra2_image_url":
          'https://drake6996.s3.us-east-2.amazonaws.com/ghana_tour/hotels/senchi/d.JPG',
      "short_name": 'Royal Senchi',
      "place": 'Akosombo',
      "address": 'Ministries PMB, 66 Gamel Abdul Naseer Ave, Accra',
      "lat": 6.219920,
      "lon": 0.089136,
      "pricing": 950,
      "rating": '4.5',
      "contact": '030 340 9170',
      "Website_url": 'www.theroyalsenchi.com',
      "amenities": ['pool', 'spa', 'free wifi']
    },
  ),
  Hotel(
    imageUrl:
        'https://drake6996.s3.us-east-2.amazonaws.com/ghana_tour/hotels/movenpick/a.jpg',
    name: 'Mövenpick A. Hotel',
    address: 'Accra',
    price: 1400,
    hotelData: {
      "name": 'Mövenpick A. Hotel',
      "image_url":
          'https://drake6996.s3.us-east-2.amazonaws.com/ghana_tour/hotels/movenpick/a.jpg',
      "extra_image_url":
          'https://drake6996.s3.us-east-2.amazonaws.com/ghana_tour/hotels/movenpick/b.jpg',
      "extra1_image_url":
          'https://drake6996.s3.us-east-2.amazonaws.com/ghana_tour/hotels/movenpick/c.jpg',
      "extra2_image_url":
          'https://drake6996.s3.us-east-2.amazonaws.com/ghana_tour/hotels/movenpick/d.jpg',
      "short_name": 'Mövenpick A.',
      "place": 'Accra',
      "address": 'Independence Avenue Ridge, Pmb Ct 343',
      "lat": 5.5557,
      "lon": -0.1963,
      "pricing": 1000,
      "rating": '4.5',
      "contact": '030 261 1000',
      "Website_url":
          'https://www.movenpick.com/en/africa/ghana/accra/moevenpick-ambassador-hotel-accra/overview/',
      "amenities": ['pool', 'bar', 'restaurants', 'free wifi']
    },
  ),
];

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ghana_tour/pages/hotel_region.dart';

class AllHotelsPanel extends StatelessWidget {
  const AllHotelsPanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1),
        children: <Widget>[
          ExtraPanel(
              locationName: "Accra",
              locationRegion: "Greater Accra",
              imageUrl: "assets/images/a.jpg",
              numberofAttractions: 10,
              selector: '1'),
          ExtraPanel(
              locationName: "Kumasi",
              locationRegion: "Ashanti",
              imageUrl: "assets/images/n.jpg",
              numberofAttractions: 10,
              selector: '16'),
          ExtraPanel(
              locationName: "Takoradi",
              locationRegion: "Western",
              imageUrl: "assets/images/o.jpg",
              numberofAttractions: 10,
              selector: '3'),
          ExtraPanel(
              locationName: "Cape Coast",
              locationRegion: "Central",
              imageUrl: "assets/images/g.jpg",
              numberofAttractions: 10,
              selector: '2'),
          ExtraPanel(
              locationName: "Tamale",
              locationRegion: "Northern",
              imageUrl: "assets/images/k.jpg",
              numberofAttractions: 10,
              selector: '6'),
          ExtraPanel(
              locationName: "Koforidua",
              locationRegion: "Eastern",
              imageUrl: "assets/images/l.jpg",
              numberofAttractions: 10,
              selector: '4'),
          ExtraPanel(
              locationName: "Ho",
              locationRegion: "Volta",
              imageUrl: "assets/images/ff.jpg",
              numberofAttractions: 10,
              selector: '12'),
          ExtraPanel(
              locationName: "Dambai",
              locationRegion: "Oti",
              imageUrl: "assets/images/aa.jpg",
              numberofAttractions: 10,
              selector: '13'),
          ExtraPanel(
              locationName: "Techiman",
              locationRegion: "Bono East",
              imageUrl: "assets/images/l.jpg",
              numberofAttractions: 10,
              selector: '10'),
          ExtraPanel(
              locationName: "Goaso",
              locationRegion: "Ahafo",
              imageUrl: "assets/images/n.jpg",
              numberofAttractions: 10,
              selector: '11'),
          ExtraPanel(
              locationName: "Sunyani",
              locationRegion: "Bono",
              imageUrl: "assets/images/cc.jpg",
              numberofAttractions: 10,
              selector: '8'),
          ExtraPanel(
              locationName: "Nalerigu",
              locationRegion: "North East",
              imageUrl: "assets/images/f.jpg",
              numberofAttractions: 10,
              selector: '5'),
          ExtraPanel(
              locationName: "Damango",
              locationRegion: "Savannah",
              imageUrl: "assets/images/k.jpg",
              numberofAttractions: 10,
              selector: '14'),
          ExtraPanel(
              locationName: "Sefwi Wiawso",
              locationRegion: "Western North",
              imageUrl: "assets/images/l.jpg",
              numberofAttractions: 10,
              selector: '15'),
          ExtraPanel(
              locationName: "Bolgatanga",
              locationRegion: "Upper East",
              imageUrl: "assets/images/k.jpg",
              numberofAttractions: 10,
              selector: '7'),
          ExtraPanel(
              locationName: "Wa",
              locationRegion: "Upper West",
              imageUrl: "assets/images/dd.jpg",
              numberofAttractions: 10,
              selector: '9'),
        ],
      ),
    );
  }
}

class ExtraPanel extends StatelessWidget {
  final String locationName;
  final String locationRegion;
  final String imageUrl;
  final String selector;
  final int numberofAttractions;

  const ExtraPanel(
      {Key key,
      this.locationName,
      this.imageUrl,
      this.locationRegion,
      this.numberofAttractions,
      this.selector})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () =>
          {Navigator.pushNamed(context, '/hotelregion', arguments: selector)},
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(imageUrl), fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[100],
        ),
        margin: EdgeInsets.all(15),
        width: 30,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 80, 0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(
                    FontAwesomeIcons.city,
                    color: Colors.white,
                    size: 8,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(locationRegion,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Text(numberofAttractions.toString() + "+ Hotels",
                  style: TextStyle(color: Colors.white, fontSize: 13)),
            ],
          ),
        ),
      ),
    );
  }
}

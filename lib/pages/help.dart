import 'package:flutter/material.dart';
import 'package:ghana_tour/extras/resource.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Help extends StatefulWidget {
  Help({Key key}) : super(key: key);

  @override
  _HelpState createState() => _HelpState();
}

class _HelpState extends State<Help> {
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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 45, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Emergency",
                style: TextStyle(
                    color: ghanaMain,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: HelpResource.ghanahelp.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return ExpansionTile(
                      title: Text(HelpResource.ghanahelp[index]["title"]),
                      children: <Widget>[
                        Text(HelpResource.ghanahelp[index]["body"])
                      ]);
                },
              ),
              Text(
                "Safety Measures",
                style: TextStyle(
                    color: ghanaMain,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[200]),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: HelpResource.dos.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                      child: Container(
                        child: Text(HelpResource.dos[index]),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Common Ghanaian Terms",
                style: TextStyle(
                    color: ghanaMain,
                    fontWeight: FontWeight.w600,
                    fontSize: 22),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[200],
                ),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: HelpResource.terms.length,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 15),
                      child: Container(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(HelpResource.terms[index]["phrase"]),
                          Icon(
                            FontAwesomeIcons.arrowRight,
                            color: ghanaExtra,
                          ),
                          Text(HelpResource.terms[index]["meaning"])
                        ],
                      )),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

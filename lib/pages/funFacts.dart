import 'package:flutter/material.dart';
import 'package:ghana_tour/extras/resource.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FunFacts extends StatelessWidget {
  const FunFacts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                "Fun Facts",
                style: TextStyle(
                    color: ghanaMain,
                    fontWeight: FontWeight.w600,
                    fontSize: 24),
              ),
              SizedBox(
                height: 10.0,
              ),
              ListView.builder(
                itemCount: HelpResource.funFacts.length,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.grey[200]),
                            padding: EdgeInsets.all(20),
                            child: Text(HelpResource.funFacts[index],
                                style: TextStyle(
                                    color: ghanaMain,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      )),
    );
  }
}

// Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: Colors.grey[200]),
//                 child: ListView.builder(
//                   itemCount: HelpResource.dos.length,
//                   shrinkWrap: true,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 8, horizontal: 15),
//                       child: Container(
//                         child: Text(HelpResource.dos[index]),
//                       ),
//                     );
//                   },
//                 ),
//               ),

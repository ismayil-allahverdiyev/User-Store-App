import 'package:comp2/widgets/stars.dart';
import 'package:flutter/material.dart';

import '../pages/others_page.dart';
import 'star.dart';

class MarketOverview extends StatefulWidget {
  MarketOverview({Key? key, required this.rate}) : super(key: key);

  double rate;

  @override
  _MarketOverviewState createState() => _MarketOverviewState();
}

class _MarketOverviewState extends State<MarketOverview> {

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Card(
      elevation: 10,
      color: Colors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
      ),
      child: SizedBox(
        height: width/2+10,
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Container(
                    height: width/2*0.8,
                    width: width-20,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage("https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-1207188789.jpg"),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.redAccent,
                      ),
                      child: Icon(Icons.add_business_rounded, color: Colors.white,),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sumer market",
                    style: TextStyle(
                        fontSize: height*0.02,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Stars(rate: widget.rate,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

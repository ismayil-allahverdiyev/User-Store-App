import 'package:comp2/pages/detail_page.dart';
import 'package:comp2/widgets/edit_button.dart';
import 'package:flutter/material.dart';

import '../pages/favorite_page.dart';
import 'decoration.dart';

class cardList extends StatefulWidget {
  cardList({Key? key, required}) : super(key: key);

@override
State<cardList> createState() => _cardListState();
}

class _cardListState extends State<cardList> {
  var currentItem = itemList.getData;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: currentItem.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              width: 180,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => DetailPage()));
                },
                child: Stack(
                  children: [
                    Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(12, 10, 7, 7),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailPage()));
                                },
                                child: Container(
                                  height: 90.0,
                                  width: 90.0,
                                  decoration: BoxDecoration(
                                    color: customBackground,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8.0),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(.5),
                                        blurRadius: 3.0,
                                        spreadRadius: 0.0,
                                        offset: Offset(
                                          0.0,
                                          3.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              currentItem[index]['name'].toString(),
                              style: style_arguments(Colors.redAccent[400],
                                  FontWeight.w800, height * 0.021, 'OpenSans'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 0,
                              thickness: 1,
                              endIndent: 20,
                              color: Colors.black26,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              currentItem[index]['brand'].toString(),
                              style: style_arguments(Colors.black,
                                  FontWeight.w400, height * 0.02, 'OpenSans'),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              currentItem[index]['type'].toString(),
                              style: style_arguments(Colors.black,
                                  FontWeight.w400, height * 0.02, 'OpenSans'),
                            ),
                          ],
                        ),
                      ),
                    ),
                    editButton(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class itemList {
  static final getData = [
    {
      'name': 'name1',
      'thumbnail': 'thumbnail1',
      'brand': 'brand1',
      'type': 'type1',
    },
    {
      'name': 'name2',
      'thumbnail': 'thumbnail2',
      'brand': 'brand2',
      'type': 'type2',
    },
    {
      'name': 'name3',
      'thumbnail': 'thumbnail3',
      'brand': 'brand3',
      'type': 'type3',
    },
    {
      'name': 'name4',
      'thumbnail': 'thumbnail4',
      'brand': 'brand4',
      'type': 'type4',
    },
    {
      'name': 'name5',
      'thumbnail': 'thumbnail5',
      'brand': 'brand5',
      'type': 'type5',
    },
  ];
}

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
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        currentItem[index]['thumbnail'].toString(),
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Text(
                              currentItem[index]['price'].toString(),
                              style: style_arguments(Colors.redAccent,
                                  FontWeight.w800, height * 0.023, 'OpenSans'),
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
                              currentItem[index]['name'].toString(),
                              style: style_arguments(Colors.black,
                                  FontWeight.w500, height * 0.021, 'OpenSans'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              currentItem[index]['brand'].toString(),
                              style: style_arguments(Colors.black,
                                  FontWeight.w500, height * 0.018, 'OpenSans'),
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
      'name': 'Süt 1 L',
      'thumbnail': 'https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/11010010/11010010-1ae231-1650x1650.jpg',
      'brand': 'Pınar',
      'price': '8,95 TL',
    },
    {
      'name': 'Jumbo Sosis 330 G',
      'thumbnail': 'https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/13502537/13502537-4a40e0-1650x1650.jpg',
      'brand': 'Banvit ',
      'price': '10.95 TL',
    },
    {
      'name': 'Masterpieces Naneli Bitter Çikolata 115 G',
      'thumbnail': 'https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/07037171/07037171-24f4ce-1650x1650.jpg',
      'brand': 'Godiva ',
      'price': '25,36 TL',
    },
    {
      'name': 'Penne Rigate (Kalem) Makarna 500 G',
      'thumbnail': 'https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/05030342/05030342-027738-1650x1650.jpg',
      'brand': 'Barilla',
      'price': '4,90 TL',
    },
    {
      'name': '15li L Boy Yumurta (63-72 G)',
      'thumbnail': 'https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/20001975/20001975-cdebd9-1650x1650.jpg',
      'brand': 'Yumurtacım',
      'price': '14,50 TL',
    },
  ];
}

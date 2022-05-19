import 'package:flutter/material.dart';

import 'decoration.dart';
import 'favorite_button.dart';
import 'item_pic.dart';

class grid_view_cardList extends StatelessWidget {
  grid_view_cardList({
    Key? key,
    required this.width,
    required this.height, this.buttonType,
  }) : super(key: key);

  final double width;
  final double height;
  final buttonType;
  var currentItem = itemList.getData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 0.1,
            mainAxisExtent: 190,
            childAspectRatio: 0.55
        ),
        itemCount: currentItem.length,
      itemBuilder: (BuildContext ctx, index){
          return Stack(
            children: [
            Card(
            color: Colors.transparent,
            elevation: 0,
            child: Padding(
              padding:
              const EdgeInsets.fromLTRB(
                  12, 15, 7, 7),
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.start,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets
                        .fromLTRB(
                        0, 5, 0, 10),
                    child: Container(
                      height: 90.0,
                      width: 90.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
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
                  Text(
                    currentItem[index]['price'].toString(),
                    style: style_arguments(
                        Colors.redAccent[400],
                        FontWeight.w800,
                        height * 0.021,
                        'OpenSans'),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Flexible(
                    child: RichText(
                      maxLines: 2,
                      overflow: TextOverflow
                          .ellipsis,
                      text: TextSpan(
                        text: currentItem[index]['brand'].toString(),
                        style: style_arguments(
                            Colors.redAccent[
                            400],
                            FontWeight.w800,
                            height * 0.021,
                            'OpenSans'),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                            currentItem[index]['name'].toString(),
                            style: style_arguments(
                                Colors.black,
                                FontWeight
                                    .w400,
                                height * 0.02,
                                'OpenSans'),
                          ),
                        ],
                      ),
                    ),
                  ),
                 
                ],
              ),
            ),
          ),
              buttonType,
            ],
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
      'thumbnail': 'https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/11012000/11012000-ad06f1-1650x1650.jpg',
      'brand': 'Sek ',
      'price': '8,95 TL',
    },
    {
      'name': 'Süt 1 L',
      'thumbnail': 'https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/11010010/11010010-1ae231-1650x1650.jpg',
      'brand': 'Pınar ',
      'price': '8,50 TL',
    },
    {
      'name': 'Rahat Laktozsuz Süt 1 L',
      'thumbnail': 'https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/11010066/icim-rahat-laktozsuz-sut-1-l-3ddedd-1650x1650.jpg',
      'brand': 'İçim ',
      'price': '7,95 TL',
    },
    {
      'name': 'Yeni Nesil Pastörize Günlük Süt 1 L',
      'thumbnail': 'https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/11019550/11019550-0aa0ab-1650x1650.jpg',
      'brand': 'Sek ',
      'price': '11,95 TL',
    },
    {
      'name': 'Yarım Yağlı Süt 1 L',
      'thumbnail': 'https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/46054060/torku-yarim-yagli-sut-1l-17c30e-1650x1650.jpg',
      'brand': 'Torku ',
      'price': '6,95 TL',
    },
    {
      'name': 'Hindistan Cevizi Sütü 1 L',
      'thumbnail': 'https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/11018885/11018885-dca238-1650x1650.png',
      'brand': 'Alpro ',
      'price': '35,50 TL',
    },
    {
      'name': 'Badem Sütü 1 L',
      'thumbnail': 'https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/11011012/11011012-4e7311-1650x1650.png',
      'brand': 'Alpro ',
      'price': '37,95 TL',
    },
    {
      'name': 'Çikolatalı Pastörize Süt 200 Ml',
      'thumbnail': 'https://migros-dali-storage-prod.global.ssl.fastly.net/sanalmarket/product/11019557/11019557-d625c3-1650x1650.jpg',
      'brand': 'Sek ',
      'price': '3,55 TL',
    },


  ];
}

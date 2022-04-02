import 'package:comp2/pages/favorite_page.dart';
import 'package:comp2/widgets/item_list_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/basket_icon.dart';
import '../widgets/location_widget.dart';
import '../widgets/market_overview.dart';

class OthersPage extends StatefulWidget {
  const OthersPage({Key? key}) : super(key: key);

  @override
  _OthersPageState createState() => _OthersPageState();
}

class _OthersPageState extends State<OthersPage> {

  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;

  static const IconData? basket_1 =
  IconData(0xe911, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: customBackground,
                  fixedSize: const Size(100, 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    basket_1,
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    '56.90',
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Location(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MarketOverview(rate: 3.7),
          ),
          itemListContainer(title: ""),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: Divider(
              thickness: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MarketOverview(rate: 2.5),
          ),
          itemListContainer(title: ""),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            child: Divider(
              thickness: 3,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MarketOverview(rate: 4.2),
          ),
          itemListContainer(title: ""),
        ],
      ),
    );
  }
}


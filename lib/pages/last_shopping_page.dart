import 'package:flutter/material.dart';
import 'package:configurable_expansion_tile_null_safety/configurable_expansion_tile.dart';
import '../widgets/basket_icon.dart';
import '../widgets/counter.dart';
import '../widgets/decoration.dart';
import '../widgets/divider.dart';
import '../widgets/item_pic.dart';
import 'home_page.dart';

const Color customBackground = Color(0xffe6e6ec);
const Color customBlue = Color(0xff0e4e93);
const Color customOceanBlue = Color(0xff638181);
const Color customBlack54 = Colors.black54;
const Color customBackgroundWhite = Colors.white;

const TextStyle customHeadline1 =
    TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: customBlack54);
const TextStyle customHeadline2 =
    TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: customBlue);
const TextStyle customBodyText1 =
    TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: customBlack54);
const TextStyle customBodyText2 =
    TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black);

void main() => runApp(const lastShopping());

class lastShopping extends StatelessWidget {
  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;

  static const IconData? basket_1 =
      IconData(0xe911, fontFamily: _kFontFam, fontPackage: _kFontPkg);

  const lastShopping({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: IconButton(
              icon: const Icon(Icons.keyboard_backspace),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              color: Colors.black,
              alignment: Alignment.centerLeft,
            ),
          ),
          title: Text('Previous Orders',
              style: style_arguments(
                  Colors.black, FontWeight.w600, height * 0.028, 'OpenSans')),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: basket_icon(),
            ),
          ],
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with TickerProviderStateMixin {
  var currentItem = itemList.getData;
  int? _currIndex;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: currentItem.length,
      itemBuilder: (BuildContext context, int index) {
        return ConfigurableExpansionTile(
          headerExpanded: SizedBox(
            width: width * 0.98,
            height: height * 0.2,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.white,
              elevation: 5,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10),
                        child: item_pic(
                          width: width,
                          height: height,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                        child: Container(
                          width: width * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.08,
                                child: Column(
                                  children: [
                                    Flexible(
                                      child: RichText(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                          text: currentItem[index]['brand']
                                              .toString(),
                                          style: style_arguments(
                                              Colors.redAccent[400],
                                              FontWeight.w800,
                                              height * 0.021,
                                              'OpenSans'),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: ('\t'),
                                            ),
                                            TextSpan(
                                              text: currentItem[index]['name']
                                                  .toString(),
                                              style: style_arguments(
                                                  Colors.black,
                                                  FontWeight.w400,
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
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text(
                                currentItem[index]['amount'].toString(),
                                style: style_arguments(
                                    Colors.black.withOpacity(0.8),
                                    FontWeight.w400,
                                    height * 0.02,
                                    'OpenSans'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 30, 15, 0),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            counter(space: 10, size: 25,),
                            SizedBox(
                              height: height * 0.015,
                            ),
                            Text(
                              "15.90",
                              style: style_arguments(Colors.redAccent[400],
                                  FontWeight.w800, height * 0.021, 'OpenSans'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    child: Icon(
                      Icons.keyboard_arrow_up,
                    ),
                  ),
                ],
              ),
            ),
          ),
          header: SizedBox(
            width: width * 0.98,
            height: height * 0.2,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.white,
              elevation: 5,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10),
                        child: item_pic(
                          width: width,
                          height: height,
                        ),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
                        child: Container(
                          width: width * 0.4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.08,
                                child: Column(
                                  children: [
                                    Flexible(
                                      child: RichText(
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                          text: currentItem[index]['brand']
                                              .toString(),
                                          style: style_arguments(
                                              Colors.redAccent[400],
                                              FontWeight.w800,
                                              height * 0.021,
                                              'OpenSans'),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: ('\t'),
                                            ),
                                            TextSpan(
                                              text: currentItem[index]['name']
                                                  .toString(),
                                              style: style_arguments(
                                                  Colors.black,
                                                  FontWeight.w400,
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
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Text(
                                currentItem[index]['amount'].toString(),
                                style: style_arguments(
                                    Colors.black.withOpacity(0.8),
                                    FontWeight.w400,
                                    height * 0.02,
                                    'OpenSans'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 30, 15, 0),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            counter(space: 10, size: 25,),
                            SizedBox(
                              height: height * 0.015,
                            ),
                            Text(
                              "15.90",
                              style: style_arguments(Colors.redAccent[400],
                                  FontWeight.w800, height * 0.021, 'OpenSans'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    child: Icon(
                      Icons.keyboard_arrow_down,
                    ),
                  ),
                ],
              ),
            ),
          ),
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Card(
                elevation: 0,
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 5, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              "Details",
                              style: style_arguments(
                                  Colors.black.withOpacity(0.6),
                                  FontWeight.w400,
                                  height * 0.02,
                                  'OpenSans'),
                            ),
                            SizedBox(
                              width: width * 0.01,
                            ),
                            Icon(
                              Icons.error_outline,
                              size: 15,
                              color: customBlack54,
                            ),
                          ],
                        ),
                      ),
                      divider(
                        color: Colors.black54.withOpacity(0.2),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Row(
                          children: [
                            Text(
                              "You paid",
                              style: style_arguments(
                                  Colors.black.withOpacity(0.8),
                                  FontWeight.w400,
                                  height * 0.02,
                                  'OpenSans'),
                            ),
                            Spacer(),
                            Text(
                              "12.90",
                              style: style_arguments(
                                  Colors.black.withOpacity(0.8),
                                  FontWeight.w400,
                                  height * 0.02,
                                  'OpenSans'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      //divider(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Row(
                          children: [
                            Text(
                              "You saved",
                              style: style_arguments(
                                  Colors.black.withOpacity(0.8),
                                  FontWeight.w400,
                                  height * 0.02,
                                  'OpenSans'),
                            ),
                            Spacer(),
                            Text(
                              "6.90",
                              style: style_arguments(
                                  Colors.black.withOpacity(0.8),
                                  FontWeight.w400,
                                  height * 0.02,
                                  'OpenSans'),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: Row(
                          children: [
                            Text(
                              "Purchase date",
                              style: style_arguments(
                                  Colors.black.withOpacity(0.8),
                                  FontWeight.w400,
                                  height * 0.02,
                                  'OpenSans'),
                            ),
                            Spacer(),
                            Text(
                              "12.18.2022",
                              style: style_arguments(
                                  Colors.black.withOpacity(0.8),
                                  FontWeight.w400,
                                  height * 0.02,
                                  'OpenSans'),
                            ),
                          ],
                        ),
                      ),
                      divider(
                        color: Colors.black54.withOpacity(0.2),
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                    color: customBackground,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                  ),
                  height: height * .2,
                  width: width,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class itemList {
  static final getData = [
    {
      'name': 'name1 name1 name1 name1 name1name1name1',
      'thumbnail': 'thumbnail1',
      'brand': 'brand1',
      'amount': 'amount1',
      'price': '56.90',
    },
    {
      'name': 'name2',
      'thumbnail': 'thumbnail2',
      'brand': 'brand2',
      'amount': 'amount2',
      'price': '56.90',
    },
    {
      'name': 'name3name3name3name3',
      'thumbnail': 'thumbnail3',
      'brand': 'brand3',
      'amount': 'amount2',
      'price': '56.90',
    },
  ];
}

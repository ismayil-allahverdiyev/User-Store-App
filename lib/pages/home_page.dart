
import 'package:comp2/pages/favorite_page.dart';
import 'package:comp2/pages/my_basket_page.dart';
import 'package:comp2/widgets/brand.dart';
import 'package:comp2/widgets/chart.dart';
import 'package:comp2/widgets/custom_appbar.dart';
import 'package:comp2/widgets/graph_info.dart';
import 'package:comp2/widgets/item_list_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/categories_model.dart';
import '../widgets/decoration.dart';
import 'last_shopping_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {


  final List<String> _listItem = [
  'assets/images/bread.jpg',
    'assets/images/peynir.jpg',
    'assets/images/süt.jpg',
    'assets/images/yogurt.jpg',


];

@override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        FocusScopeNode focusScopeNode = FocusScope.of(context);
        if(!focusScopeNode.hasPrimaryFocus){
          focusScopeNode.unfocus();
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            ListView(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 10, 8, 0),
                  child: CustomAppBar(),
                ),
                SizedBox(
                  height: height * 0.019,
                ),
                Brand(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                  child: Stack(
                    children: [
                      itemListContainer(
                        title: "Favorites",
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => favoritePage()));
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8,10, 8, 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Text("Last shopping",
                                        style: style_arguments(
                                            Colors.black,
                                            FontWeight.w600,
                                            height * 0.021,
                                            'OpenSans')),
                                    Icon(CupertinoIcons.shopping_cart)
                                  ],
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                icon: const Icon(Icons.arrow_forward),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              lastShopping()));
                                },
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: width/2.5,
                                    height: width/2,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                        image: NetworkImage("https://www.jonesandcane.co.uk/wp-content/uploads/2016/02/American-grocery-bag.jpg"),
                                        fit: BoxFit.cover
                                      )
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(8, 16, 8, 0),
                                    child: Text(
                                        "At: 12/04/2022",
                                      style: style_arguments(
                                          Colors.black,
                                          FontWeight.w600,
                                          height * 0.021,
                                          'OpenSans'),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Chart(
                                    graphInformation: [
                                      GraphInfo("Total spend", 120),
                                      GraphInfo("Total saved", 40),
                                      // GraphInfo("Total spend", 120),
                                    ],
                                  maxValue: 160
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                itemListContainer(
                 title: "Suggestions",
                ),
                 SizedBox(
                 height: 20,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text("Categories", style: TextStyle(color: Color(0xff475b63), fontSize: height*0.022, fontWeight: FontWeight.bold, letterSpacing: 1.2),),
                        SizedBox(height: 20,),
                        Container(
                          child: GridView.count(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            crossAxisCount: 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            children: categories.map((item) => Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage(item.url),
                                        fit: BoxFit.cover,
                                      colorFilter: ColorFilter.mode(Colors.grey.withOpacity(0.7), BlendMode.darken)
                                    )
                                ),
                                height: 50,
                                width: 100,
                                alignment: Alignment.center,
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15
                                  ),
                                ),
                              ),
                            )).toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 90,)

              ],
            ),
           
          ],
        ),
      ),
    );
  }
}

class CategoriesModel{

  late final String name;
  late final String url;

  CategoriesModel({ required this.url,  required this.name});

}





import 'package:comp2/widgets/add_basket.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/customAppBar.dart';
import '../widgets/decoration.dart';
import '../widgets/grid_view_cardList.dart';
import '../widgets/edit_button.dart';


class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () {
          FocusScopeNode focusScopeNode = FocusScope.of(context);

          if (focusScopeNode.hasFocus) {
            focusScopeNode.unfocus();
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: Size(width, height * 0.2),
            child: customAppBar(),
          ),
          body: ListView(
            children: [
              SafeArea(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Container(
                        height: height * 0.07,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                child: ListView.builder(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    itemCount: categories.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {
                                          //  Navigator.push(context, MaterialPageRoute(builder: (context) => Categorie(categorieName: title.toLowerCase())));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 4.0),
                                          child: Stack(
                                            children: <Widget>[
                                              ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(8.0),
                                                child: Image.asset(
                                                  categories[index]
                                                      .url
                                                      .toString(),
                                                  height: height * 0.2,
                                                  width: width * 0.25,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.black26,
                                                  borderRadius:
                                                  BorderRadius.circular(
                                                      8.0),
                                                ),
                                                height: height * 0.2,
                                                width: width * 0.25,
                                                alignment: Alignment.center,
                                                child: Text(
                                                    categories[index]
                                                        .name
                                                        .toString(),
                                                    style: style_arguments(
                                                        Colors.white,
                                                        FontWeight.w500,
                                                        height * 0.021,
                                                        'OpenSans')),
                                              )
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                height: height*0.65,
                                child: grid_view_cardList(height: height, width: width, buttonType: editButton(),),
                              ),
                            ],
                          ),
                        ),
                    ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



List<CategoriesModel> categories = [
  CategoriesModel(url: "assets/images/bread.jpg", name: "bread"),
  CategoriesModel(url: "assets/images/yogurt.jpg", name: "yogurt"),
  CategoriesModel(url: "assets/images/kola.jpg", name: "coke"),
  CategoriesModel(url: "assets/images/peynir.jpg", name: "cheese"),
  CategoriesModel(url: "assets/images/bread.jpg", name: "bread"),
];

class CategoriesModel {
  late final String name;
  late final String url;

  CategoriesModel({required this.url, required this.name});
}

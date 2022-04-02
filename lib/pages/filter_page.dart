import 'package:comp2/widgets/divider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../models/products.dart';
import '../widgets/decoration.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({Key? key}) : super(key: key);

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final categorie = [
    CheckBoxState(title: "Dairy Products"),
    CheckBoxState(title: "Drinks"),
    CheckBoxState(title: "Frozen Food"),
    CheckBoxState(title: "Oil"),
    CheckBoxState(title: "Snacks"),
    CheckBoxState(title: "Nuts"),
    CheckBoxState(title: "Grains"),
    CheckBoxState(title: "Dried Legums"),
    CheckBoxState(title: "Bakery"),
    CheckBoxState(title: "Meat Products"),
    CheckBoxState(title: "Canned Food"),
    CheckBoxState(title: "Confectionery")
  ];
  List market = [
    "A101",
    "BIM",
    "MIGROS",
    "ŞOK",
  ];

  final product = [
    CheckBoxState(title: "Milk"),
    CheckBoxState(title: "Coke"),
    CheckBoxState(title: "Yogurt"),
    CheckBoxState(title: "Cheese")
  ];

  final brand = [
    CheckBoxState(title: "İçim"),
    CheckBoxState(title: "Pınar"),
    CheckBoxState(title: "Sütaş"),
  ];
  String? val = '';
  String? val2 = '';
  String? val3 = '';
  String? val4 = '';
  double _currentSliderValue = 20;
  bool _value = false;
  bool value = false;

  @override
  Widget build(BuildContext context) {
    Widget makeDismissible({required Widget child}) => GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: GestureDetector(
        onTap: () {},
        child: child,
      ),
    );

    final products = Provider.of<Products>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: makeDismissible(
        child: DraggableScrollableSheet(
          maxChildSize: 0.8,
          minChildSize: 0.3,
          initialChildSize: 0.8,
          builder: (_, controller) => Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
            ),
            padding: EdgeInsets.all(16),
            child: ListView(
              controller: controller,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    child: Theme(

                      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(title: Text('Markets'), children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: market.length,
                          itemBuilder: (context, index) {
                            return RadioListTile<String>(
                              title: Text(market[index]),
                              value: market[index],
                              groupValue: val2,
                              onChanged: (value) {
                                setState(
                                      () {
                                    val2 = value;
                                    if (val2 == "A101") {}
                                  },
                                );
                              },
                            );
                          },
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.deepOrange,
                            ),
                            child: TextButton(
                              onPressed: () {
                                products.filterList(val2);
                              },
                              child:  Text(
                                "OK",
                                style: style_arguments(
                                    Colors.white, FontWeight.bold, 15, 'Open Sans'),
                              ),
                            ),
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                divider(color: Colors.black54.withOpacity(0.2)),
                Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Text("Brand"),
                    children: [
                      ...brand.map(buildCheckboxListTile).toList(),
                    ],
                  ),
                ),
                divider(color: Colors.black54.withOpacity(0.2)),
                Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(title: Text('Price'), children: [
                    Slider(
                      value: _currentSliderValue,
                      min: 0,
                      max: 100,
                      divisions: 5,
                      label: _currentSliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _currentSliderValue = value;
                        });
                      },
                    )
                  ]),
                ),
                divider(color: Colors.black54.withOpacity(0.2)),
                Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Text("Products"),
                    children: [
                      ...product.map(buildCheckboxListTile).toList(),
                    ],
                  ),
                ),
                divider(color: Colors.black54.withOpacity(0.2)),
                Theme(
                  data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
                  child: ExpansionTile(
                    title: Text("Categorie"),
                    children: [
                      ...categorie.map(buildCheckboxListTile).toList(),
                    ],
                  ),
                ),

                /* ExpansionTile(title: Text('Categories'), children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemCount: categorie.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(top: 10),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 30,
                                    vertical: 10
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget> [
                                      Text(categorie[index], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 25,
                                        child: Checkbox(
                                          value: false,
                                          onChanged: (bool? value){

                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.deepOrange,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    products.filterList(val);
                                  },
                                  child: const Text(
                                    "OK",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCheckboxListTile(CheckBoxState checkbox) {
    return CheckboxListTile(
      value: checkbox.value,
      onChanged: (value) => setState(() => checkbox.value = value!),
      title: Text(
        checkbox.title,
        style: style_arguments(
            Colors.black.withOpacity(0.8), FontWeight.normal, 20, 'Open Sans'),
      ),
    );
  }
}

class CheckBoxState {
  final String title;
  bool value;

  CheckBoxState({required this.title, this.value = false});
}

import 'package:comp2/pages/filter_page.dart';
import 'package:comp2/pages/sort_page.dart';
import 'package:flutter/material.dart';

class filter_button extends StatelessWidget {
  const filter_button({
    Key? key,
    required this.width,
  }) : super(key: key);

  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: const Icon(Icons.tune),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => FilterPage()));
          },
        ),
        SizedBox(
          width: width * 0.005,
        ),
        VerticalDivider(
          thickness: 1,
          color: Colors.grey,
        ),
        SizedBox(
          width: width * 0.005,
        ),
        GestureDetector(
          child: const Icon(Icons.swap_vert),
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SortPage()));
          },
        ),
      ],
    );
  }
}

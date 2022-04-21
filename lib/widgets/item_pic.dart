import 'package:flutter/material.dart';

const Color customBackground = Color(0xffe6e6ec);

class item_pic extends StatelessWidget {
  const item_pic({
    Key? key,
    required this.height,
    required this.width,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height/4,
      width: width/4,
      decoration: BoxDecoration(
        color: customBackground,
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(.5),
            blurRadius: 3.0,
            spreadRadius: 0.0,
            offset: const Offset(
              0.0,
              3.0,
            ),
          ),
        ],
      ),
    );
  }
}

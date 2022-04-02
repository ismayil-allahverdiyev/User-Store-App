import 'package:flutter/material.dart';

class editButton extends StatelessWidget {
  editButton({Key? key,}) : super(key: key);
  Color customBackground = Color(0xffe6e6ec);
  Color customBlue = Color(0xff729b79);


  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 18,
      left: 85,
      child: SizedBox(
        height: 30,
        width: 30,
        child: FloatingActionButton(
          heroTag: null,
          shape: RoundedRectangleBorder(
            side:  BorderSide(width: 2, color: customBlue),
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: customBackground,
          mini: true,
          // foregroundColor: customBlue,
          onPressed: () {},
          child: Icon(
            Icons.add, color: Color(0xff729b79),
          ),
        ),
      ),
    );
  }
}

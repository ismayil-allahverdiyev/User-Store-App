import 'package:flutter/material.dart';

class editButton extends StatelessWidget {
  editButton({Key? key,}) : super(key: key);
  Color customBackground = Color(0xffe6e6ec);
  Color customBlue = Color(0xff729b79);


  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      right: 12,
      child: SizedBox(
        height: 27,
        width: 27,
        child: FloatingActionButton(
          heroTag: null,
          shape: RoundedRectangleBorder(
            side:  BorderSide(width: 2, color: Colors.redAccent),
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: Colors.white,
          mini: true,
          // foregroundColor: customBlue,
          onPressed: () {},
          child: Icon(
            Icons.add, color: Colors.redAccent,
          ),
        ),
      ),
    );
  }
}

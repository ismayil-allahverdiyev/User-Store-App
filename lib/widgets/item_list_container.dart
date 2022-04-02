import 'package:comp2/widgets/cardList.dart';
import 'package:flutter/material.dart';

import 'decoration.dart';

class itemListContainer extends StatelessWidget {
  itemListContainer({
    Key? key,
    required this.title,
  }) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 280,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8.0),
            ),
            color: Colors.grey[100],
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 5.0,
                spreadRadius: 0.0,
                offset: const Offset(
                  0.0,
                  5.0,
                ),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              title!="" ? Padding(
                padding: EdgeInsets.only(left: 8.0, top: 8, bottom: 8),
                child: SizedBox(
                  height: height * 0.023,
                  child: FittedBox(
                    child: Text(
                        title,
                        style: style_arguments(
                            Colors.black.withOpacity(0.8),
                            FontWeight.w600,
                            height * 0.023,
                            'OpenSans',
                        ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ),
              ) : Container(),
              Expanded(child: cardList()),
              // const Expanded(
              //   flex: 0,
              //   child: Text(""),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

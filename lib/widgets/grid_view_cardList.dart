import 'package:flutter/material.dart';

import 'decoration.dart';
import 'favorite_button.dart';
import 'item_pic.dart';

class grid_view_cardList extends StatelessWidget {
  const grid_view_cardList({
    Key? key,
    required this.width,
    required this.height, this.buttonType,
  }) : super(key: key);

  final double width;
  final double height;
  final buttonType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Stack(
        children: [
          Card(
            color: Colors.transparent,
            elevation: 0,
            child: Padding(
              padding:
              const EdgeInsets.fromLTRB(
                  12, 15, 7, 7),
              child: Column(
                mainAxisAlignment:
                MainAxisAlignment.start,
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets
                        .fromLTRB(
                        0, 5, 0, 10),
                    child: item_pic(
                      width: width,
                      height: height,
                    ),
                  ),
                  Text(
                    '56.90',
                    style: style_arguments(
                        Colors.redAccent[400],
                        FontWeight.w800,
                        height * 0.021,
                        'OpenSans'),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Flexible(
                    child: RichText(
                      maxLines: 3,
                      overflow: TextOverflow
                          .ellipsis,
                      text: TextSpan(
                        text: 'brand ',
                        style: style_arguments(
                            Colors.redAccent[
                            400],
                            FontWeight.w800,
                            height * 0.021,
                            'OpenSans'),
                        children: <TextSpan>[
                          TextSpan(
                            text:
                            'name name name',
                            style: style_arguments(
                                Colors.black,
                                FontWeight
                                    .w400,
                                height * 0.02,
                                'OpenSans'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Text(
                    'type',
                    style: style_arguments(
                        Colors.black
                            .withOpacity(0.8),
                        FontWeight.w400,
                        height * 0.02,
                        'OpenSans'),
                  ),
                ],
              ),
            ),
          ),
          buttonType,
        ],
      ),
    );
  }
}
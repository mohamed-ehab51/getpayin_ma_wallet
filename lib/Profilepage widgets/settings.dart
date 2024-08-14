import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Mainpage widgets/Transactionstyle.dart';
class Settingswidget extends StatelessWidget {
  final String label;
  final double width;
  final double height;
  final String type;
  final Icon icon;

  Settingswidget(
      {required this.label,
        required this.width,
        required this.type,
        required this.icon,
        required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Container(
          margin: EdgeInsets.symmetric(horizontal: 8.0),
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      minRadius: 28,
                      backgroundColor: Colors.transparent,
                      child: this.icon
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          label,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          type,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Icon(Icons.keyboard_arrow_right_sharp,
                    color: Colors.grey, size: 30)
              ],
            ),
          )),
    );
  }
}

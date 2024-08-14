import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Transactionstyle.dart';
class BarWidget extends StatelessWidget {
  final String label;
  final String amount;
  final double width;
  final double height;
  final String type;
  final Transaction_style style;

  BarWidget(
      {required this.label,
        required this.amount,
        required this.width,
        required this.type,
        required this.style,
        required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
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
                      backgroundColor: style.color.withOpacity(.2),
                      child: Icon(
                        style.icon.icon,
                        color: style.color,
                        size: 35,
                      ),
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
                Text(
                  "$amount",
                  style: TextStyle(
                      color: amount[0] == '+' ? Colors.green : Colors.red,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )),
    );
  }
}

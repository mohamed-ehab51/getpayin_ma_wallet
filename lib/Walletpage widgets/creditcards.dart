import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;
class Creditcard extends StatelessWidget {
  final String client_name;
  final double balance;
  final String EXP;
  final String Cardnum;
  final String type;
  final double width;
  final double height;

  Creditcard(
      {required this.client_name,
      required this.EXP,
      required this.Cardnum,
      required this.type,
      required this.balance,
      required this.width,
      required this.height});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15),
      child: Container(
          width: width * 0.8,
          height: height * 0.2,
          decoration: BoxDecoration(
              color: type == "mastercard"
                  ? Colors.yellowAccent.withOpacity(.3)
                  : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Total Balance",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "\$${NumberFormat("#,###,###,###.00", "en_US").format(balance)}",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 15),
                              child: type == "mastercard"
                                  ? Image.asset(
                                      "assets/images/mastercard_logo.png",
                                      width: 50,
                                      height: 50,
                                    )
                                  : Image.asset(
                                      "assets/images/visa_logo1.png",
                                      width: 50,
                                      height: 50,
                                    ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(Cardnum.substring(0,4),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(
                                width: 20,
                              ),
                              Text("••••",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(
                                width: 20,
                              ),
                              Text("••••",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(
                                width: 20,
                              ),
                              Text(Cardnum.substring(12,16),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey.shade700,
                                      fontWeight: FontWeight.w600)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 9),
                    child: Container(
                        height: Platform.isAndroid? height * .07:height * .075,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            )),
                        child: Padding(
                          padding: EdgeInsets.all(9),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    client_name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Exp",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Text(
                                    EXP,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                  )
                ],
              ))),
    );
  }
}

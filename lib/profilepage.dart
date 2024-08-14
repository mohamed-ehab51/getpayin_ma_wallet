import 'dart:io';
import 'package:barcode/barcode.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ma_wallet/walletpage.dart';
import 'Mainpage widgets/Transactionstyle.dart';
import 'Profilepage widgets/settings.dart';
import 'global.dart' as global;
import 'Walletpage widgets/creditcards.dart';

class myprofile extends StatefulWidget {
  const myprofile({super.key});

  @override
  State<myprofile> createState() => _myprofileState();
}

class _myprofileState extends State<myprofile> {
  late int selectedIndex;
  void onItemTapped(int index) {
    if (index == 0) {
      setState(() {
        selectedIndex = index;
        Navigator.pop(context);
      });
    }
    if (index == 1) {
      setState(() {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => mywallet()));
      });
    }
  }

  final double balance = 25000.40;
  Transaction_style Saving = Transaction_style(
      color: Colors.deepPurpleAccent, icon: Icon(Icons.file_download_outlined));
  Transaction_style Subscription_fee =
      Transaction_style(color: Colors.orange, icon: Icon(Icons.laptop));
  Transaction_style Shopping_fee = Transaction_style(
      color: Colors.pinkAccent, icon: Icon(Icons.shopping_bag_outlined));
  Transaction_style Salary =
      Transaction_style(color: Colors.green, icon: Icon(Icons.credit_card));

  @override
  void initState() {
    super.initState();
    selectedIndex = 3;
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 22,
                    ),
                    Text(
                      "Profile",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                    GestureDetector(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            final barcode = Barcode.qrCode();
                            final qrImage = barcode.toSvg("@${global.client_name.replaceAll(" ", "_")}", width: 200, height: 200);
                            return AlertDialog(
                              title: Text("My QR code"),
                              content: Container(
                                height: screenHeight * .4,
                                width: screenWidth * .8,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Scan this code to pay me",style: TextStyle(fontSize: 20),),
                                    SizedBox(height: 20,),
                                    Container(
                                      child: SvgPicture.string(qrImage,width: 300,height: 300,),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Close"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Icon(
                        Icons.qr_code_scanner,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 40,
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                      backgroundColor: Colors.orangeAccent,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "@${global.client_name.replaceAll(" ", "_")}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.all(0),
                  child: Container(
                    height: Platform.isAndroid ? screenHeight * .74:screenHeight * .68,
                    child: ListView(scrollDirection: Axis.vertical, children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, bottom: 10, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Your cards",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                          padding:
                              EdgeInsets.only(bottom: 30, left: 10, right: 22),
                          child: Container(
                            height: screenHeight * .21,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  for (int i = 0; i < global.cards.length; i++)
                                    Creditcard(
                                      client_name: global.cards[i].clientname,
                                      balance: global.cards[i].balance,
                                      EXP: global.cards[i].EXP,
                                      Cardnum: global.cards[i].cardnum,
                                      type: global.cards[i].type,
                                      width: screenWidth,
                                      height: screenHeight,
                                    ),
                                ]),
                          )),
                      Padding(
                        padding:
                            EdgeInsets.only(bottom: 20, left: 22, right: 22),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Manage",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  child: Settingswidget(
                                    label: "Appearance",
                                    type: "Customize your app",
                                    icon: Icon(
                                      Icons.color_lens,
                                      size: 40,
                                      color: Colors.black,
                                    ),
                                    width: screenWidth * .9,
                                    height: screenHeight * .1,
                                  ),
                                ),
                                Container(
                                  child: Settingswidget(
                                    label: "Settings",
                                    type: "Change personal information",
                                    icon: Icon(
                                      Icons.settings,
                                      size: 40,
                                      color: Colors.black,
                                    ),
                                    width: screenWidth * .9,
                                    height: screenHeight * .1,
                                  ),
                                ),
                                Container(
                                  child: Settingswidget(
                                    label: "Cards",
                                    type: "Edit or remove cards",
                                    icon: Icon(
                                      Icons.credit_score,
                                      size: 40,
                                      color: Colors.black,
                                    ),
                                    width: screenWidth * .9,
                                    height: screenHeight * .1,
                                  ),
                                ),
                                Container(
                                  child: Settingswidget(
                                    label: "Help",
                                    type: "Get help",
                                    icon: Icon(
                                      Icons.help,
                                      size: 40,
                                      color: Colors.black,
                                    ),
                                    width: screenWidth * .9,
                                    height: screenHeight * .1,
                                  ),
                                ),
                                Container(
                                  child: Settingswidget(
                                    label: "Contact us",
                                    type: "Reach out to us",
                                    icon: Icon(
                                      Icons.call,
                                      size: 40,
                                      color: Colors.black,
                                    ),
                                    width: screenWidth * .9,
                                    height: screenHeight * .1,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ]),
                  ))
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            backgroundColor: Colors.white,
            elevation: 0,
            showSelectedLabels: false, // Hide labels on selected items
            showUnselectedLabels: false,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            onTap: onItemTapped,
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.wallet),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.insert_chart_outlined_rounded),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline_rounded),
                label: '',
              ),
            ], // This trailing comma makes auto-formatting nicer for build methods.
          )),
    );
  }
}

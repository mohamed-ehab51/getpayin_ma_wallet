import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ma_wallet/profilepage.dart';
import 'Mainpage widgets/Bars.dart';
import 'Mainpage widgets/Transaction.dart';
import 'global.dart' as global;
import 'Mainpage widgets/Transactionstyle.dart';
import 'Walletpage widgets/cardsdata.dart';
import 'Walletpage widgets/creditcards.dart';
import 'dart:io' show Platform;

import 'Walletpage widgets/dialogue.dart';

class mywallet extends StatefulWidget {
  const mywallet({super.key});

  @override
  State<mywallet> createState() => _mywalletState();
}

class _mywalletState extends State<mywallet> {
  late int selectedIndex;
  void onItemTapped(int index) {
    if (index == 0) {
      setState(() {
        selectedIndex = index;
        Navigator.pop(context);
      });
    }
    if (index == 3) {
      setState(() {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => myprofile()));
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

  void _showInputDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return InputDialog(
          onSubmit: (inputs) {
            setState(() {
              global.cards.add(cardsdata(
                  balance: double.parse(inputs[0]),
                  cardnum: inputs[1],
                  clientname: global.client_name,
                  type: inputs[3],
                  EXP: inputs[2]));
            });
          },
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    selectedIndex=1;

  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    final List<Transaction> transactions = [
      Transaction(
          style: Subscription_fee,
          label: 'Dribble',
          amount: -15,
          type: "Subscription fee"),
      Transaction(style: Saving, label: 'House', amount: -50, type: "Saving"),
      Transaction(
          style: Shopping_fee,
          label: 'Sony Camera',
          amount: -200,
          type: "Shopping fee"),
      Transaction(
          style: Subscription_fee,
          label: 'Patreon',
          amount: -15,
          type: "Subscription fee"),
      Transaction(style: Salary, label: 'Paypal', amount: 32, type: "Salary"),
    ];


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
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => myprofile()));
                      },
                      child: CircleAvatar(
                        radius: 22,
                        child: Icon(Icons.person),
                        backgroundColor: Colors.orangeAccent,
                      ),
                    ),
                    Text(
                      "Wallet",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 25),
                    ),
                    Icon(
                      Icons.more_vert,
                      size: 30,
                    )
                  ],
                ),
              ),
              Padding(
                  padding:
                  EdgeInsets.only(top: 25, bottom: 30, left: 10, right: 22),
                  child: Container(
                    height: screenHeight * .21,
                    child:
                    ListView(scrollDirection: Axis.horizontal, children: [
                      for (int i = 0; i < global.cards.length + 1; i++)
                        i == 0
                            ? GestureDetector(onTap: (){
                          _showInputDialog();
                        },
                          child: Padding(
                            padding: EdgeInsets.only(left: 1,right: 10),
                            child: DottedBorder(
                              borderType: BorderType.RRect,
                              radius: Radius.circular(12),
                              dashPattern: [9, 9],
                              strokeWidth: 2,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                  child: Container(
                                      width: screenWidth * .08,
                                      color: Colors.white,
                                      child: Center(
                                          child: Icon(
                                            Icons.add_circle,
                                            size: 30,
                                            color: Colors.black,))
                                  )),
                            ),
                          ),)
                            : Creditcard(
                          client_name: global.cards[i - 1].clientname,
                          balance: global.cards[i - 1].balance,
                          EXP: global.cards[i - 1].EXP,
                          Cardnum: global.cards[i - 1].cardnum,
                          type: global.cards[i - 1].type,
                          width: screenWidth,
                          height: screenHeight,
                        ),
                    ]),
                  )),
              Padding(
                padding: EdgeInsets.only(bottom: 20, left: 22, right: 22),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "Transactions",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.tune_outlined),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Container(
                        height: Platform.isAndroid
                            ? screenHeight * .5
                            : screenHeight * .44,
                        child:
                        ListView(scrollDirection: Axis.vertical, children: [
                          for (Transaction transaction in transactions)
                            BarWidget(
                              label: transaction.label,
                              type: transaction.type,
                              style: transaction.style,
                              amount: transaction.amount > 0
                                  ? '+\$${NumberFormat("#,###,###,###.00", "en_US").format(transaction.amount)}'
                                  : '-\$${NumberFormat("#,###,###,###.00", "en_US").format(-transaction.amount)}',
                              width: screenWidth * .6,
                              height: screenHeight * .1,
                            ),
                        ]),
                      ),
                    )
                  ],
                ),
              ),
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


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ma_wallet/global.dart' as global;
import 'package:ma_wallet/profilepage.dart';
import 'package:ma_wallet/walletpage.dart';
import 'Mainpage widgets/Bars.dart';
import 'Mainpage widgets/Cards.dart';
import 'Mainpage widgets/Earning.dart';
import 'Mainpage widgets/Transaction.dart';
import 'Mainpage widgets/Transactionstyle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late int selectedIndex;
  void onItemTapped(int index) {
    if (index == 1) {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const mywallet()),
        );
      });
    }
    if (index == 3) {
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const myprofile()),
        );
      });
    }
  }
  @override
  void initState() {
    super.initState();
     selectedIndex=0;
  }
  @override
  Widget build(BuildContext context) {
    final double balance = 25000.40;
    final double income = 20000;
    final double outcome = 17000;
    final List<Earning> earnings = [
      Earning(label: 'Upwork', amount: 3000, color: Colors.red),
      Earning(
          label: 'Freepik',
          amount: 3000,
          color: Color.fromRGBO(228, 144, 158, 1)),
      Earning(
          label: 'Envato',
          amount: 2000,
          color: Color.fromRGBO(52, 108, 193, 1)),
      Earning(label: 'Fiverr', amount: 1500, color: Colors.green),
      Earning(label: 'Github', amount: 2500, color: Colors.orange),
    ];
    Transaction_style Subscription_fee =
        Transaction_style(color: Colors.orange, icon: Icon(Icons.laptop));
    Transaction_style Shopping_fee = Transaction_style(
        color: Colors.pinkAccent, icon: Icon(Icons.shopping_bag_outlined));
    Transaction_style Salary =
        Transaction_style(color: Colors.green, icon: Icon(Icons.credit_card));
    final List<Transaction> transactions = [
      Transaction(
          style: Subscription_fee,
          label: 'Adobe Illustrator',
          amount: -32,
          type: "Subscription fee"),
      Transaction(
          style: Subscription_fee,
          label: 'Dribble',
          amount: -15,
          type: "Subscription fee"),
      Transaction(
          style: Shopping_fee,
          label: 'Sony Camera',
          amount: -200,
          type: "Shopping fee"),
      Transaction(style: Salary, label: 'Paypal', amount: 32, type: "Salary"),
    ];
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 244, 1),
      body: SafeArea(
        child: SingleChildScrollView(
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
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const myprofile()),
                              );
                            },
                            child: CircleAvatar(radius: 22,child: Icon(Icons.person),backgroundColor: Colors.orangeAccent,),
                            ),

                          SizedBox(
                            width: screenWidth * 0.05,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Good Morning!",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Text(
                                global.client_name,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ],
                      ),
                      Icon(CupertinoIcons.bell)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                      width: screenWidth * 0.9,
                      height: screenHeight * 0.18,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Stack(children: [
                            Positioned(
                                top: 0,
                                right: -63,
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(255, 167, 63, 1)),
                                  width: 100,
                                  height: 100,
                                )),
                            Positioned(
                              top: -60,
                              right: -36,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.blueAccent),
                                width: 100,
                                height: 100,
                              ),
                            ),
                            Positioned(
                                bottom: -70,
                                left: -36,
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color.fromRGBO(68, 139, 117, 1)),
                                  width: 100,
                                  height: 100,
                                )),
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 15),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Total Balance",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Text(
                                    "\$${NumberFormat("#,###,###,###.00", "en_US").format(balance)}",
                                    style: TextStyle(
                                        fontSize: 34,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text("My Wallet",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500)),
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const mywallet()),
                                              );
                                            },
                                            style: ButtonStyle(
                                                shape: WidgetStateProperty.all<
                                                    CircleBorder>(
                                              CircleBorder(),
                                            )),
                                            child: Icon(
                                              CupertinoIcons.arrow_right,
                                              color: Colors.black,
                                            ))
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ]))),
                ),
                Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Container(
                        width: screenWidth * 0.9,
                        height: screenHeight * 0.11,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Stack(
                              children: [
                                Positioned(
                                    right: -22,
                                    bottom: -25,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Color.fromRGBO(255, 167, 63, 1)),
                                      width: 50,
                                      height: 50,
                                    )),
                                Positioned(
                                    left: -25,
                                    top: -30,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color:
                                              Color.fromRGBO(165, 133, 177, 1)),
                                      width: 50,
                                      height: 50,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(
                                      CupertinoIcons.arrow_down,
                                      color: Colors.green,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 4),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Income",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "\$${NumberFormat("#,###,###,###", "en_US").format(income)}",
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 5, right: 5),
                                      child: SizedBox(
                                        height: screenHeight * 0.07,
                                        child: VerticalDivider(
                                          color: Colors.grey,
                                          thickness: 2,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      CupertinoIcons.arrow_up,
                                      color: Colors.red,
                                      size: 40,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 4),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Outcome",
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "\$${NumberFormat("#,###,###,###", "en_US").format(outcome)}",
                                            style: TextStyle(
                                                fontSize: 22,
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )))),
                Padding(
                  padding: EdgeInsets.only(bottom: 30, left: 22, right: 22),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Earnings",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "See All",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          height: screenWidth * .38,
                          child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                for (Earning earning in earnings)
                                  CardWidget(
                                    color: earning.color,
                                    label: earning.label,
                                    amount:
                                        '\$ ${NumberFormat("#,###,###,###", "en_US").format(earning.amount)}',
                                    width: screenWidth * .36,
                                    height: screenWidth * .6,
                                  ),
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
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
                            child: Text(
                              "See All",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Today",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20, bottom: 20),
                        child: Container(
                          height: screenWidth * .55,
                          child: ListView(
                              scrollDirection: Axis.vertical,
                              children: [
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
      ),
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            onTap: onItemTapped,
            backgroundColor: Colors.white,
            elevation: 0,
            showSelectedLabels: false, // Hide labels on selected items
            showUnselectedLabels: false,
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

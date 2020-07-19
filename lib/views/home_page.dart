import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> dummyData = [
    {
      "image": "assets/images/openshop.jpg",
      "shopName": "Desserts",
      "sellerName": "The Sweetman",
      "category": "Sweets",
    },
    {
      "image": "assets/images/openshop.jpg",
      "shopName": "Fresh'O Juicy",
      "sellerName": "The Freshman",
      "category": "Grocery",
    },
    {
      "image": "assets/images/openshop.jpg",
      "shopName": "Food Mart",
      "sellerName": "The Foodman",
      "category": "Supermart",
    },
    {
      "image": "assets/images/openshop.jpg",
      "shopName": "Essestianls",
      "sellerName": "The Needman",
      "category": "Daily Needs",
    },
    {
      "image": "assets/images/openshop.jpg",
      "shopName": "Essestianls",
      "sellerName": "The Needman",
      "category": "Daily Needs",
    },
  ];

  bool dialVisible = true;

  Future _scan() async {
    String barcode = await scanner.scan();
    if (barcode != null) {
      Navigator.of(context).pushReplacementNamed('/homePage');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.18,
              margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.width * 0.02,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.height * 0.02),
                ),
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      child: ClipRRect(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(
                                  MediaQuery.of(context).size.height * 0.02)),
                          child: Image.asset(
                            dummyData[index]['image'],
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height *
                                (0.18 - (0.01)),
                          )),
                    ),
                    Container(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * 0.02),
                      width: MediaQuery.of(context).size.width * (1 - (0.46)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: FittedBox(
                              child: Text(dummyData[index]['shopName'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline6
                                      .copyWith(
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.03,
                                        // color: Colors.orange[700],
                                        fontWeight: FontWeight.bold,
                                      )),
                            ),
                          ),
                          FittedBox(
                            child: Text(dummyData[index]['sellerName'],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                      color: Colors.black87,
                                      // fontWeight: FontWeight.bold,
                                    )),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                dummyData[index]['category'],
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.018,
                                      color: Colors.black54,
                                      // fontWeight: FontWeight.bold,
                                    ),
                              ),
                              GestureDetector(
                                onTap: null,
                                child: Icon(
                                  Icons.favorite_border,
                                  // color: Colors.orange[700],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: dummyData.length,
        ),
        Container(
          margin: EdgeInsets.only(right: 10, bottom: 8),
          child: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            animatedIconTheme: IconThemeData(size: 25.0, color: Colors.white),
            visible: dialVisible,
            // curve: Curves.easeIn,
            animationSpeed: 150,
            backgroundColor: Theme.of(context).primaryColor,
            elevation: 6,
            // overlayOpacity: 0,
            children: [
              SpeedDialChild(
                child:
                    Icon(Icons.camera, color: Theme.of(context).primaryColor),
                backgroundColor: Colors.white,
                onTap: _scan,
                label: 'Scan QR code',
                labelBackgroundColor: Colors.white,
              ),
              SpeedDialChild(
                child: Icon(Icons.account_circle,
                    color: Theme.of(context).primaryColor),
                backgroundColor: Colors.white,
                onTap: () => Navigator.of(context).pushNamed('/addShopPage'),
                label: 'Add contacts',
                labelBackgroundColor: Colors.white,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

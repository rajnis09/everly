import 'package:flutter/material.dart';

import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import '../utils/theme/theme_data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> dummyData = [
    {
      "image": "assets/images/load.jpg",
      "shopName": "Desserts",
      "sellerName": "The Sweetman",
      "category": "Sweets",
    },
    {
      "image": "assets/images/load.jpg",
      "shopName": "Fresh'O Juicy",
      "sellerName": "The Freshman",
      "category": "Grocery",
    },
    {
      "image": "assets/images/load.jpg",
      "shopName": "Food Mart",
      "sellerName": "The Foodman",
      "category": "Supermart",
    },
    {
      "image": "assets/images/load.jpg",
      "shopName": "Essestianls",
      "sellerName": "The Needman",
      "category": "Daily Needs",
    },
    {
      "image": "assets/images/load.jpg",
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
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.18,
            padding: const EdgeInsets.all(8.0),
            child: Card(
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.height * 0.02),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: Image.asset(
                      dummyData[index % 4]['image'],
                      fit: BoxFit.cover,
                      height:
                          MediaQuery.of(context).size.height * (0.18 - (0.01)),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.width * 0.02),
                    width: MediaQuery.of(context).size.width * (1 - (0.46)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Text(dummyData[index % 4]['shopName'],
                              style: CustomThemeData.robotoFont.copyWith(
                                color: CustomThemeData.blackColorShade1,
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.03,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        FittedBox(
                          child: Text(dummyData[index % 4]['sellerName'],
                              style: CustomThemeData.latoFont.copyWith(
                                  fontSize:
                                      MediaQuery.of(context).size.height * 0.02,
                                  color: CustomThemeData.blackColorShade2
                                  // fontWeight: FontWeight.bold,
                                  )),
                        ),
                        FittedBox(
                          child: Text(
                            dummyData[index % 4]['category'],
                            style: CustomThemeData.montserratFont.copyWith(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.018,
                                color: CustomThemeData.blackColorShade3
                                // fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        // itemCount: dummyData.length,
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(size: 25.0, color: Colors.white),
        visible: dialVisible,
        curve: Curves.easeIn,
        animationSpeed: 50,
        overlayOpacity: 0.5,
        children: [
          SpeedDialChild(
            child: Icon(Icons.camera_alt, color: Colors.white),
            backgroundColor: CustomThemeData.greyColorShade,
            onTap: _scan,
            label: 'Scan',
            labelStyle: CustomThemeData.latoFont.copyWith(
                color: CustomThemeData.blackColorShade1,
                fontWeight: FontWeight.bold),
            labelBackgroundColor: Colors.white,
          ),
          SpeedDialChild(
            child: Icon(Icons.phone, color: Colors.white),
            backgroundColor: CustomThemeData.greyColorShade,
            onTap: () => Navigator.of(context).pushNamed('/addShopPage'),
            label: 'Via Phone',
            labelStyle: CustomThemeData.latoFont.copyWith(
                color: CustomThemeData.blackColorShade1,
                fontWeight: FontWeight.bold),
            labelBackgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

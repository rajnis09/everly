import 'package:flutter/material.dart';

import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import '../presentation/custom_icons.dart';

import '../utils/theme/theme_data.dart';

class ShopListingPage extends StatefulWidget {
  @override
  _ShopListingPageState createState() => _ShopListingPageState();
}

class _ShopListingPageState extends State<ShopListingPage> {
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
    String scanResult = await scanner.scan();
    if (scanResult != null) {
      print(scanResult);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0,60,0,0),
              child: ListView.builder(
                
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushNamed('/shopDetailsPage'),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //   color: Colors.black,
                          // ),
                          borderRadius: BorderRadius.all(
                             Radius.circular(10),
                              // topLeft: Radius.circular(10),
                              // bottomLeft: Radius.circular(10)
                              ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: size * .15,
                                // width: double.infinity,
                                child: Image.asset(
                                  dummyData[index % 4]['image'],
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                // width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      dummyData[index % 4]['shopName'],
                                      style: CustomThemeData.robotoFont.copyWith(
                                        color: CustomThemeData.blackColorShade1,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text("Description"),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                  // SizedBox(
                  //   height: 10,
                  // ),
                },
                // itemCount: dummyData.length,
              ),
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 2.0), //(x,y)
                    blurRadius: 6.0,
                  ),
                ],
              gradient: LinearGradient(
                colors: <Color>[
                  Color(0xff0F2027),
                  Color(0xff203A43),
                  Color(0xff2C5364)
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Container(
              padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Home',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.pushNamed(context, '/notificationPage'),
                        child: Icon(
                          Icons.notifications_none,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                ),
                SizedBox(width: 10,),
                Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: GestureDetector(
                        onTap: () => Navigator.pushNamed(context, '/cartPage'),
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                ),
                    ],
                  ),
                ],
              ),
              // margin: EdgeInsets.only(
              //   top: 5,
              //   left: 24,
              // ),
            ),
          ),
        ],
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        animatedIconTheme: IconThemeData(
          size: 25.0,
          color: Colors.white,
        ),
        visible: dialVisible,
        curve: Curves.easeIn,
        animationSpeed: 50,
        overlayOpacity: 0.5,
        children: <SpeedDialChild>[
          SpeedDialChild(
            child: Icon(
              CustomIcons.qrcode,
              color: Colors.white,
            ),
            backgroundColor: CustomThemeData.greyColorShade,
            onTap: _scan,
            label: 'Scan',
            labelStyle: CustomThemeData.latoFont.copyWith(
              color: CustomThemeData.blackColorShade1,
              fontWeight: FontWeight.bold,
            ),
            labelBackgroundColor: Colors.white,
          ),
          SpeedDialChild(
            child: Icon(
              Icons.phone,
              color: Colors.white,
            ),
            backgroundColor: CustomThemeData.greyColorShade,
            onTap: () => Navigator.of(context).pushNamed('/addShopPage'),
            label: 'Via Phone',
            labelStyle: CustomThemeData.latoFont.copyWith(
              color: CustomThemeData.blackColorShade1,
              fontWeight: FontWeight.bold,
            ),
            labelBackgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}

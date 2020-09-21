import 'package:flutter/material.dart';

import 'package:qrscan/qrscan.dart' as scanner;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

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
    String scanResult = await scanner.scan();
    if (scanResult != null) {
      print(scanResult);
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView.builder(
        // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        // crossAxisCount: 2,
        // childAspectRatio: 3 / 4,
        // mainAxisSpacing: 10,
        // crossAxisSpacing: 10),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child:
                GestureDetector(
                  onTap: () =>
                      Navigator.of(context).pushNamed('/shopDetailsPage'),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // border: Border.all(
                      //   color: Colors.black,
                      // ),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      color: Colors.grey[100],
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

                  // height: MediaQuery.of(context).size.height * 0.18,
                  // padding: const EdgeInsets.all(8.0),
                  // child: Card(
                  //   clipBehavior: Clip.antiAlias,
                  //   shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(
                  //       MediaQuery.of(context).size.height * 0.02,
                  //     ),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Container(
                  //         width: MediaQuery.of(context).size.width * 0.35,
                  //         child: Image.asset(
                  //           dummyData[index % 4]['image'],
                  //           fit: BoxFit.cover,
                  //           height: MediaQuery.of(context).size.height *
                  //               (0.18 - (0.01)),
                  //         ),
                  //       ),
                  //       Container(
                  //         padding: EdgeInsets.all(
                  //           MediaQuery.of(context).size.width * 0.02,
                  //         ),
                  //         width: MediaQuery.of(context).size.width * (1 - (0.46)),
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           children: <Widget>[
                  //             FittedBox(
                  //               child: Text(
                  //                 dummyData[index % 4]['shopName'],
                  //                 style: CustomThemeData.robotoFont.copyWith(
                  //                   color: CustomThemeData.blackColorShade1,
                  //                   fontSize:
                  //                       MediaQuery.of(context).size.height * 0.03,
                  //                   fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             ),
                  //             FittedBox(
                  //               child: Text(
                  //                 dummyData[index % 4]['sellerName'],
                  //                 style: CustomThemeData.latoFont.copyWith(
                  //                   fontSize:
                  //                       MediaQuery.of(context).size.height * 0.02,
                  //                   color: CustomThemeData.blackColorShade2,
                  //                   // fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             ),
                  //             FittedBox(
                  //               child: Text(
                  //                 dummyData[index % 4]['category'],
                  //                 style: CustomThemeData.montserratFont.copyWith(
                  //                   fontSize:
                  //                       MediaQuery.of(context).size.height * 0.018,
                  //                   color: CustomThemeData.blackColorShade3,
                  //                   // fontWeight: FontWeight.bold,
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                ),);
                // SizedBox(
                //   height: 10,
                // ),
        },
        // itemCount: dummyData.length,
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
              Icons.camera_alt,
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

import 'package:flutter/material.dart';

import '../../widgets/build_list_items.dart';
import '../../widgets/network_builder.dart';
import '../../utils/theme/theme_data.dart';

class OrderDetailsPage extends StatefulWidget {
  @override
  _OrderDetailsPageState createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  final _orderID = 1545753432423;

  final _dummyData = ['load.jpg', 'sugar.png', '1.png', '2.png', '3.png'];
  final _dummyOrderUpdates = [
    'Ordered on : 25/07/2020 6:30PM',
    'Delivered on: 26/07/2020 8:30AM'
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Details'),
      ),
      body: NetworkBuilder(
        child: Container(
          height: size.height,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: size.height * 0.06,
                  padding: EdgeInsets.fromLTRB(
                      size.height * 0.058 * 0.28,
                      size.height * 0.058 * 0.39,
                      size.height * 0.058 * 0.28,
                      size.height * 0.058 * 0.28 * 0.5),
                  child: Text(
                    'Order ID: $_orderID',
                    style: CustomThemeData.latoFont.copyWith(
                      color: CustomThemeData.blackColorShade3,
                    ),
                  ),
                ),
                divider,
                Container(
                  height: size.height * 0.45 * 0.8,
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: size.height * 0.4 * 0.17,
                        padding: EdgeInsets.fromLTRB(
                            size.height * 0.4 * 0.05,
                            size.height * 0.4 * 0.05,
                            size.height * 0.4 * 0.05,
                            size.height * 0.4 * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            FittedBox(
                              child: Text(
                                'Total ${_dummyData.length} items',
                                style: CustomThemeData.latoFont.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.4 * 0.17 * 0.36),
                              ),
                            ),
                            FittedBox(
                              child: Text(
                                'Price : Rs. 400',
                                style: CustomThemeData.latoFont.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.4 * 0.17 * 0.36),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: _dummyData.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                  elevation: 3.0,
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0)),
                                  child: LayoutBuilder(
                                      builder: (context, constraints) {
                                    return Container(
                                      width: size.width * 0.4,
                                      alignment: Alignment.bottomCenter,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/${_dummyData[index]}'),
                                            fit: BoxFit.cover),
                                      ),
                                      child: Container(
                                        padding: const EdgeInsets.all(8.0),
                                        alignment: Alignment.bottomCenter,
                                        height: constraints.maxHeight * 0.3,
                                        width: double.infinity,
                                        color: Colors.white,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            // This is to be filled by the data
                                            Text(
                                              'Name',
                                              style: CustomThemeData.latoFont
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: constraints
                                                              .maxHeight *
                                                          0.25 *
                                                          0.3),
                                            ),
                                            Text(
                                              'Price',
                                              style: CustomThemeData.latoFont
                                                  .copyWith(
                                                      fontSize: constraints
                                                              .maxHeight *
                                                          0.25 *
                                                          0.25),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                              );
                            }),
                      ),
                      divider,
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(
                      size.height * 0.058 * 0.28,
                      size.height * 0.03 * 0.39,
                      size.height * 0.058 * 0.28,
                      size.height * 0.03 * 0.28 * 0.5),
                  child: Text(
                    'Order Updates',
                    style: CustomThemeData.latoFont.copyWith(
                      color: CustomThemeData.blackColorShade3,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        child: Text(
                          _dummyOrderUpdates[0],
                          textScaleFactor: 1.2,
                          style: CustomThemeData.latoFont,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        child: Text(
                          _dummyOrderUpdates[1],
                          textScaleFactor: 1.2,
                          style: CustomThemeData.latoFont,
                        ),
                      ),
                    ],
                  ),
                ),
                divider,
                buildListItem(context, 'Need help', Icons.help, null, () {
                  Navigator.pushNamed(context, '/supportPage');
                }, size.height * 0.025),
                divider,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(
                      size.height * 0.058 * 0.28,
                      size.height * 0.03 * 0.39,
                      size.height * 0.058 * 0.28,
                      size.height * 0.03 * 0.28 * 0.5),
                  child: Text(
                    'Shipping Details',
                    style: CustomThemeData.latoFont.copyWith(
                      color: CustomThemeData.blackColorShade3,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8.0),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FittedBox(
                          child: Text(
                        'Tony Shark',
                        textScaleFactor: 1.2,
                        style: CustomThemeData.latoFont.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                      SizedBox(height: 10),
                      FittedBox(
                          child: Text(
                        'Avengers Tower, NY',
                        textScaleFactor: 1.2,
                        style: CustomThemeData.latoFont.copyWith(),
                      )),
                    ],
                  ),
                ),
                divider,
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(
                      size.height * 0.058 * 0.28,
                      size.height * 0.03 * 0.39,
                      size.height * 0.058 * 0.28,
                      size.height * 0.03 * 0.28 * 0.5),
                  child: Text(
                    'Price Details',
                    style: CustomThemeData.latoFont.copyWith(
                      color: CustomThemeData.blackColorShade3,
                    ),
                  ),
                ),
                // Change it later to listview if required
                Container(
                  padding: EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8.0),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FittedBox(
                        child: Text(
                          'Cost 1 = Rs 150',
                          textScaleFactor: 1.2,
                          style: CustomThemeData.latoFont,
                        ),
                      ),
                      SizedBox(height: 10),
                      FittedBox(
                        child: Text(
                          'Cost 2 = Rs 250',
                          textScaleFactor: 1.2,
                          style: CustomThemeData.latoFont,
                        ),
                      ),
                      SizedBox(height: 10),
                      FittedBox(
                        child: Text(
                          'Total: Rs 450',
                          textScaleFactor: 1.2,
                          style: CustomThemeData.latoFont.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                divider,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

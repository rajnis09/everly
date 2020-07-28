import 'package:everly/utils/theme/theme_data.dart';
import 'package:flutter/material.dart';

import '../model/shop_items.dart';

class ShopDetailsPage extends StatefulWidget {
  @override
  _ShopDetailsPageState createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage> {
  String dropdownValue = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Items'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.18,
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 8),
                        child: Image.asset(
                          shopItem.shopItems[index]["image"],
                          fit: BoxFit.contain,
                          height: 60,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 8, top: 8),
                            child: Text(
                              shopItem.shopItems[index]["itemName"],
                              style: Theme.of(context).textTheme.headline4,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 8),
                            child: Text(
                              shopItem.shopItems[index]["price"] +
                                  ' per ' +
                                  shopItem.shopItems[index]["amount"],
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    child: Row(
                      children: [
                        Text('Qty '),
                        DropdownButton<String>(
                          value: shopItem.shopItems[index]["quantity"],
                          icon: Icon(Icons.arrow_drop_down),
                          iconSize: 15,
                          underline: Container(
                            height: 2,
                            color: CustomThemeData.blueColorShade1,
                          ),
                          elevation: 25,
                          style: TextStyle(color: Colors.deepPurple),
                          onChanged: (String newValue) {
                            setState(() {
                              shopItem.shopItems[index]["quantity"] = newValue;
                            });
                          },
                          items: <String>[
                            '1',
                            '2',
                            '3',
                            '4',
                            '5',
                            '6',
                            '7',
                            '8',
                            '9',
                            '10'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: shopItem.shopItems.length,
      ),
    );
  }
}

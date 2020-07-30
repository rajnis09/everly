import 'package:flutter/material.dart';

import '../model/shop_items.dart';
import '../utils/theme/theme_data.dart';

class ShopDetailsPage extends StatefulWidget {
  @override
  _ShopDetailsPageState createState() => _ShopDetailsPageState();
}

class _ShopDetailsPageState extends State<ShopDetailsPage> {
  String dropdownValue = '1';
  double curPrice = 1;

  update(newValue, index) {
    setState(() {
      curPrice = shopItem.shopItems[index]["price"];
      double preQty = double.parse(shopItem.shopItems[index]["quantity"]);
      shopItem.shopItems[index]["quantity"] = newValue;
      if (preQty < double.parse(newValue)) {
        curPrice = curPrice * double.parse(newValue);
        shopItem.shopItems[index]["price"] = curPrice;
      } else {
        curPrice /= preQty;
        curPrice *= double.parse(newValue);
        shopItem.shopItems[index]["price"] = curPrice;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop Items'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.15,
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
                          width: MediaQuery.of(context).size.width * 0.16,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8, top: 10),
                        width: MediaQuery.of(context).size.width * (1 - 0.22),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Text(
                                shopItem.shopItems[index]["itemName"],
                                style: Theme.of(context).textTheme.headline4,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FittedBox(
                                  child: Text(
                                    shopItem.shopItems[index]["price"]
                                            .toString() +
                                        ' / ' +
                                        shopItem.shopItems[index]["amount"],
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Qty'),
                                      ),
                                      DropdownButton<String>(
                                        value: shopItem.shopItems[index]
                                            ["quantity"],
                                        icon: Icon(Icons.arrow_drop_down),
                                        iconSize: 25,
                                        underline: Container(
                                          height: 2,
                                          color:
                                              CustomThemeData.blueColorShade1,
                                        ),
                                        elevation: 25,
                                        style: TextStyle(
                                            color: CustomThemeData
                                                .blueColorShade1),
                                        onChanged: (String newValue) {
                                          update(newValue, index);
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
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
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
                          ],
                        ),
                      ),
                    ],
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

import 'package:everly/model/shop_items.dart';
import 'package:flutter/material.dart';

import '../widgets/cart_list_item.dart';
import '../widgets/custom_button.dart';
import '../utils/theme/theme_data.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var _totalPrice = 0.0;
  List<Map<String, Object>> _items;

  @override
  void initState() {
    _items = shopItem.shopItems;
    _items.forEach((element) {
      _totalPrice += element['price'];
    });
    super.initState();
  }

  void _deleteCartItem(String id, double price) {
    setState(() {
      _items.removeWhere((element) => element['itemName'] == id);
      _totalPrice -= price;
    });
  }

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Theme.of(context).primaryColor,
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("My Cart"),
      ),
      backgroundColor: Colors.grey.shade100,
      body: ListView(
        children: <Widget>[
          Container(
            height: 50,
            margin: const EdgeInsets.only(
              top: 16,
              right: 16,
              left: 16,
            ),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 30),
                  child: Text(
                    "Total x Item",
                    style: textStyle,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Text(
                    "\u20B9 $_totalPrice",
                    style: textStyle,
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemBuilder: (_, idx) => CartListItem(
              key: UniqueKey(),
              name: _items[idx]['itemName'],
              price: _items[idx]['price'],
              imageURL: _items[idx]['image'],
              delete: () => _deleteCartItem(
                  _items[idx]['itemName'], _items[idx]['price']),
            ),
            itemCount: _items.length,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 60,
            ),
            child: CustomButton(
              disabledColor: CustomThemeData.blueColorShade2,
              height: 40,
              onPressed: _items.length == 0 ? null : () {},
              child: Text(
                'Checkout',
                style: TextStyle(
                  color: CustomThemeData.whiteColor,
                  fontSize: 16,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

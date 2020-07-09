import 'dart:async';
import 'package:flutter/material.dart';

import 'package:qrscan/qrscan.dart' as scanner;

class AddShopPage extends StatefulWidget {
  @override
  _AddShopPageState createState() => _AddShopPageState();
}

class _AddShopPageState extends State<AddShopPage> {
  // Future _scan() async {
  //   String barcode = await scanner.scan();
  //   // print("hello" + barcode);
  // }

  Future _scan() async {
    String barcode = await scanner.scan();
    if (barcode != null) {
      Navigator.of(context).pushReplacementNamed('/homePage');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            // height: size.height * 0.8,
            width: size.width <= 400 ? size.width * 0.8 : size.width * 0.7,
            child: Form(
              child: TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.contact_phone,color: Colors.orange[700]),
                  labelText: 'Enter Phone number',
                ),
              ),
            ),
          ),
        ),
        SizedBox(height:size.height * 0.05),
        Center(
          child: Container(
            margin: EdgeInsets.only(left:size.width <= 400 ? size.width * 0.12 : size.width * 0.17),
            // padding: EdgeInsets.all(size.width <= 400 ? size.width * 0.05 : size.width * 0.05),
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: _scan,
              child: Row(
                // mainAxisSize: MainAxisSize.max,
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Icon(Icons.camera_alt,color: Colors.orange[700],),
                Text('Scan QR code',style: Theme.of(context).textTheme.headline5.copyWith(
                  fontWeight: FontWeight.bold,
                ),),
              ],),
            ),
          ),
        ),
      ],
    ));
  }
}

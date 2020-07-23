import 'package:flutter/material.dart';

class AddShopPage extends StatefulWidget {
  @override
  _AddShopPageState createState() => _AddShopPageState();
}

class _AddShopPageState extends State<AddShopPage> {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Shop'),
      ),
      body: Center(
        // child: Container(
        //   height: size.height * 0.8,
        //   width: size.width <= 400 ? size.width * 0.8 : size.width * 0.7,
        //   child: Form(
        //     child: TextFormField(
        //       decoration: InputDecoration(
        //         prefixIcon: Icon(Icons.phone, color: Colors.orange[700]),
        //         labelText: 'Enter Phone number',
        //       ),
        //     ),
        //   ),
        // ),
        child: Text('Page UI is not implemented as it should have to', textScaleFactor: 1.2,),
      ),
    );
  }
}

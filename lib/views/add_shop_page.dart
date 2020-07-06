import 'package:flutter/material.dart';

import 'package:qr_code_scanner/qr_code_scanner.dart';

class AddShopPage extends StatefulWidget {
  @override
  _AddShopPageState createState() => _AddShopPageState();
}

class _AddShopPageState extends State<AddShopPage> {
  // Future _scan() async {
  //   String barcode = await scanner.scan();
  //   // print("hello" + barcode);
  // }

  QRViewController controller;
  var qrText = '';
  final GlobalKey qrKey = GlobalKey();

  bool isPhoneSelected = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // var changedQrHeight = size.height - appbar.pre;
    // var changedPhoneHeight = size.height * 0.05;
    return Scaffold(
      body: isPhoneSelected
          ? Center(
              child: Container(
                // height: size.height * 0.8,
                width: size.width <= 400 ? size.width * 0.8 : size.width * 0.7,
                child: Form(
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.contact_phone),
                      labelText: 'Enter Phone number',
                    ),
                  ),
                ),
              ),
            )
          : Column(
              children: [
                Container(
                  height:
                      (size.height - (Scaffold.of(context).appBarMaxHeight)) *
                          0.8,
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      borderColor: Colors.orange[700],
                      borderRadius: 10,
                      borderLength: 30,
                      borderWidth: 10,
                      cutOutSize: 300,
                    ),
                  ),
                ),
                Container(
                  // margin: EdgeInsets.all(5),
                  alignment: Alignment.centerRight,
                  height: size.height * 0.1,
                  child: GestureDetector(
                    onTap: () {
                      print(' hello! ');
                      setState(() {
                        isPhoneSelected = true;
                      });
                    },
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.phone_android,
                            color: Colors.orange[700],
                          ),
                          Text(
                            'Add Phone',
                            style: TextStyle(color: Colors.orange[700]),
                          ),
                        ]),
                  ),
                ),
              ],
            ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
        if (qrText != null) {
          Navigator.of(context).pushReplacementNamed('/homePage');
        }
      });
    });
  }
}

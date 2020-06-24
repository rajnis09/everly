import 'package:flutter/material.dart';

import '../../utils/forms/sign_up_email_form.dart';
import '../../widgets/cubic_clipper.dart';
import '../../utils/forms/sign_up_phonenumber_form.dart';
import '../../widgets/logo_widget.dart';

class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.40),
              color: Colors.orange[50],
              height: size.height * 0.60,
              child: ClipPath(
                clipper: CubicClipper(),
                child: Container(
                  height: size.height * 1,
                  color: Colors.white,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(kToolbarHeight - 25),
                    height: size.height * 0.20,
                    alignment: Alignment.center,
                    child: LogoWidget(
                      size: size.width * 0.4,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.06,
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      'SignUp',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.orange[700],
                          fontSize: MediaQuery.of(context).size.height * 0.05,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  // SignUpWithEmailForm(),
                  SignUpWithPhoneForm(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../utils/theme/theme_data.dart';
import '../../utils/forms/sign_up_phonenumber_form.dart';
import '../../widgets/logo_widget.dart';

class SignUpPhonePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
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
                  style: CustomThemeData.robotoFont.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: MediaQuery.of(context).size.height * 0.05,
                  ),
                ),
              ),
              SignUpWithPhoneForm(),
            ],
          ),
        ),
      ),
    );
  }
}

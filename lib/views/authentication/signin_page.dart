import 'package:flutter/material.dart';

import '../../utils/theme/theme_data.dart';
import '../../widgets/custom_button.dart';
import '../../utils/forms/sign_in_form.dart';
import '../../widgets/logo_widget.dart';
import '../../widgets/network_builder.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Welcome to Everly :)',
            style: CustomThemeData.robotoFont.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: size.height * 0.035,
              color: CustomThemeData.blackColorShade1,
            ),
          ),
          elevation: 0.0,
        ),
        body: NetworkBuilder(
          child: Container(
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Container(
                  //   padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  //   alignment: Alignment.centerLeft,
                  //   height: size.height * 0.06,
                  //   child: Text(
                  //     'Welcome to Everly :)',
                  //     textAlign: TextAlign.start,
                  //     style: CustomThemeData.robotoFont.copyWith(
                  //       fontWeight: FontWeight.bold,
                  //       fontSize: size.height * 0.035,
                  //       color: CustomThemeData.blackColorShade1,
                  //     ),
                  //   ),
                  // ),
                  Container(
                    margin: EdgeInsets.all(size.height * 0.05),
                    height: size.height * 0.20,
                    alignment: Alignment.center,
                    child: LogoWidget(
                      size: size.width * 0.4,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    alignment: Alignment.centerLeft,
                    height: size.height * 0.06,
                    child: Text(
                      'Login',
                      textAlign: TextAlign.start,
                      style: CustomThemeData.robotoFont.copyWith(
                        fontSize: size.height * 0.045,
                        fontWeight: FontWeight.bold,
                        color: CustomThemeData.blackColorShade1,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SignInForm(),
                  Container(
                    width: size.width * 0.7,
                    height: size.height * 0.04,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Divider(
                            color: Colors.grey,
                            thickness: 1,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'OR',
                          style: CustomThemeData.robotoFont.copyWith(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: CustomThemeData.blackColorShade2,
                          ),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Divider(
                            color: CustomThemeData.greyColorShade,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    child: CustomButton(
                      height: size.height * 0.055,
                      width: size.width * 0.7,
                      onPressed: () =>
                          Navigator.pushNamed(context, '/signUpPhonePage'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.phone,
                            size: size.height * 0.038,
                            color: CustomThemeData.whiteColor,
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Text(
                            'Sign up with phone',
                            style: CustomThemeData.robotoFont.copyWith(
                              fontSize: size.width * 0.038,
                              color: CustomThemeData.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  // Below code will be removed once the need of direct login is finished
                  Container(
                    child: CustomButton(
                      // backgroundColor: Color(0xFF3D5AFE),
                      height: size.height * 0.055,
                      width: size.width * 0.7,
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/homePage'),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.forward,
                            size: size.height * 0.038,
                            color: CustomThemeData.whiteColor,
                          ),
                          SizedBox(
                            width: size.width * 0.01,
                          ),
                          Text(
                            'Direct Login',
                            style: CustomThemeData.robotoFont.copyWith(
                              fontSize: size.width * 0.038,
                              color: CustomThemeData.whiteColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  // End of code to be deleted
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

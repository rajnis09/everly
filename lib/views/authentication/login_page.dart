import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/cubic_clipper.dart';
import '../../utils/forms/sign_in_form.dart';
import '../../widgets/logo_widget.dart';
import '../background_size.dart';
// TODO: for @ravi implemnt following
// Add login with phone option
// improve signUp option, like change place in App, or change UI of button etc.
// Add Google plus signIn option at the bottom of the screen as decided in the layout or whrerver in page and anytype G+ signIn UI but it should match with the rest of UI and look appealing
// add the wave style, Look and responsiveness of UI shouldn't change and the functionality too
// Use color code const Color(0xFFF57C00) wherever needed
// After then all depends on you that what best you can do with the UI
// Bonus task if possible then add a "Welcome to Everly" type text on the top most of page only if it will look better because there is no where on login page everly name is mentioned

class LoginPage extends StatelessWidget {
  // static const  double backgroundSize;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final sizeHeight = size.height.toString();
    // BackgroundSize(backgroundHeight:sizeHeight);
    // const String height = BackgroundSize().backgroundHeight;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: size.height * 0.40,
                  bottom: 0,
                  right: 0,
                  left: 0),
              color: Colors.orange[50],
//         width:MediaQuery.of(context).size.width * ,
              height:  size.height * 0.6,

              child: ClipPath(
                clipper: CubicClipper(),
                child: Container(
                  // height: const backgroundSize,
                  color: Colors.white,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    alignment: Alignment.centerLeft,
                    height: size.height * 0.06,
                    child: Text(
                      'Welcome to Everly :)',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline6.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: size.height * 0.035,
                          ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(kToolbarHeight - size.height * 0.06),
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
                      'LogIn',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.orange[700],
                          fontSize: size.height * 0.045,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  SignInForm(),
                  // SizedBox(
                  //   height: 1,
                  // ),
                  Center(
                    child: Text(
                      '-----------OR------------',
                      style: TextStyle(
                          color: Colors.orange[700],
                          fontSize: size.height * 0.02,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: CustomButton(
                          height: size.height * 0.05,
                          width: size.width * 0.36,
                          onPressed: () =>
                              Navigator.pushNamed(context, '/signUpPage'),
                          child: Text(
                            'Sign up with email',
                            style: TextStyle(
                                fontSize: size.width * 0.03,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Container(
                        child: CustomButton(
                          height: size.height * 0.05,
                          width: size.width * 0.36,
                          onPressed: () =>
                              Navigator.pushNamed(context, '/signUpPage'),
                          child: Text(
                            'Sign up with phone',
                            style: TextStyle(
                                fontSize: size.width * 0.03,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      // Container(
                      //   child: GestureDetector(
                      //     child: Image.asset(
                      //       'assets/images/google_sign_in.png',
                      //       height: size.height * 0.04,
                      //     ),
                      //     onTap: () =>
                      //         Navigator.pushNamed(context, '/signUpPage'),
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../utils/forms/sign_in_form.dart';
import '../../widgets/logo_widget.dart';

// TODO: for @ravi implemnt following
// Add login with phone option
// improve signUp option, like change place in App, or change UI of button etc.
// Add Google plus signIn option at the bottom of the screen as decided in the layout or whrerver in page and anytype G+ signIn UI but it should match with the rest of UI and look appealing
// add the wave style, Look and responsiveness of UI shouldn't change and the functionality too
// Use color code const Color(0xFFF57C00) wherever needed
// After then all depends on you that what best you can do with the UI
// Bonus task if possible then add a "Welcome to Everly" type text on the top most of page only if it will look better because there is no where on login page everly name is mentioned

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
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
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                alignment: Alignment.centerLeft,
                height: size.height * 0.06,
                child: Text(
                  'LogIn',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.orange[700],
                      fontSize: size.height * 0.05,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SignInForm(),
              SizedBox(
                height: 1,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(
                      top: 0,
                      left: mediaQuery.size.width * 0.09,
                      right: 10,
                      bottom: 0),
                  child: FlatButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, '/signUpPage'),
                    child: Row(
                      children: [
                        Text(
                          'Don\'t have an account? Sign Up',
                          style: TextStyle(color: Colors.black87, fontSize: 12),
                        ),
                        Icon(Icons.account_circle, color: Colors.black87),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              // Container(
              //   color: Colors.orange,
              //   child: ClipPath(
              //     // clipper: CubicClipper(),
              //     child: Container(
              //       height: mediaQuery.size.height * 0.35,
              //       color: Colors.white,
              //       // child: Center(child: Text("WaveClipperTwo(reverse: true)"),),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

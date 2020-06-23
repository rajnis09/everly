import 'package:flutter/material.dart';
import '../../widgets/cubic_clipper.dart';
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
    // final mediaQuery = MediaQuery.of(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Welcome to Everly :)',
          ),
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.40,
                  bottom: 0,
                  right: 0,
                  left: 0),
              color: Colors.orange[50],
//         width:MediaQuery.of(context).size.width * ,
              height: size.height * 0.60,
              child: ClipPath(
                clipper: CubicClipper(),
                child: Container(
                  height: size.height * 1,
                  color: Colors.white,
                  // child: Center(child: Text("WaveClipperTwo(reverse: true)"),),
                ),
              ),
            ),
            Column(
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
                  child: Text(
                    '-----------Or------------',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  child: GestureDetector(
                    child: Text(
                      'Create account',
                      style: TextStyle(
                          color: Colors.orange[700],
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () => Navigator.pushNamed(context, '/signUpPage'),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}

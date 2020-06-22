import 'package:flutter/material.dart';
import 'package:everly/utils/forms/sign_in_form.dart';
import 'package:everly/widgets/logo_widget.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              // Row(
              //   children: [
              //     Container(
              //       padding: EdgeInsets.only(
              //           top: 0,
              //           left: mediaQuery.size.width * 0.09,
              //           right: 10,
              //           bottom: 0),
              //       child: FlatButton(
              //         onPressed: () =>
              //             Navigator.pushNamed(context, '/resetPasswordPage'),
              //         child: Text('Forgot password!',
              //             style: TextStyle(color: Colors.black87, fontSize: 15)),
              //       ),
              //     ),
              //     Container(
              //       padding: EdgeInsets.only(
              //           top: 0,
              //           left: mediaQuery.size.width * 0.11,
              //           right: 10,
              //           bottom: 0),
              //       child: FlatButton(
              //         onPressed: null,
              //         child: Row(
              //           children: [
              //             Text(
              //               'Phone number',
              //               style: TextStyle(color: Colors.black87, fontSize: 15),
              //             ),
              //             Icon(Icons.phone, color: Colors.black87),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
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

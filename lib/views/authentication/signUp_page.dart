import 'package:everly/utils/forms/sign_up_form.dart';
import 'package:flutter/material.dart';

import '../../widgets/logo_widget.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
                  'Signup',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: Colors.orange[700],
                      fontSize: MediaQuery.of(context).size.height * 0.05,
                      fontWeight: FontWeight.bold),
                ),
              ),
              // Container(
              //   height: MediaQuery.of(context).size.height * 0.54,
              //   width: MediaQuery.of(context).size.width * 0.75,
              //   // color: Colors.purple,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //     mainAxisSize: MainAxisSize.max,
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: <Widget>[
              //       Container(
              //         height: MediaQuery.of(context).size.height * 0.1,
              //         width: 300,
              //         child: TextFormField(
              //           decoration: const InputDecoration(
              //             prefixIcon: Icon(Icons.person),
              //             labelText: "Name",
              //           ),
              //           keyboardType: TextInputType.text,
              //         ),
              //       ),
              //       Container(
              //         height: MediaQuery.of(context).size.height * 0.1,
              //         width: 300,
              //         child: TextFormField(
              //           decoration: const InputDecoration(
              //             prefixIcon: Icon(Icons.email),
              //             labelText: "Your Email or Mobile number",
              //           ),
              //           keyboardType: TextInputType.emailAddress,
              //         ),
              //       ),
              //       Container(
              //         height: MediaQuery.of(context).size.height * 0.1,
              //         width: 300,
              //         child: TextFormField(
              //           decoration: const InputDecoration(
              //             prefixIcon: Icon(Icons.lock),
              //             labelText: "Password",
              //           ),
              //           keyboardType: TextInputType.visiblePassword,
              //           obscureText: true,
              //         ),
              //       ),
              //       Container(
              //         height: MediaQuery.of(context).size.height * 0.1,
              //         width: 300,
              //         child: TextFormField(
              //           decoration: const InputDecoration(
              //             prefixIcon: Icon(Icons.lock),
              //             labelText: "Confirm Password",
              //           ),
              //           obscureText: true,
              //         ),
              //       ),
              //       SizedBox(
              //         height: 5,
              //       ),
              //       Container(
              //         height: MediaQuery.of(context).size.height * 0.1,
              //         width: 300,
              //         child: FloatingActionButton(
              //           heroTag: 'signUp',
              //           onPressed: () => {},
              //           backgroundColor: Colors.redAccent,
              //           child: Icon(
              //             Icons.keyboard_arrow_right,
              //             size: MediaQuery.of(context).size.height * 0.08,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   color: Colors.orange,
              //   child: ClipPath(
              //     // clipper: CubicClipper(),
              //     child: Container(
              //       height: MediaQuery.of(context).size.height * 0.25,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              SignUpForm(),
            ],
          ),
        ),
      ),
    );
  }
}

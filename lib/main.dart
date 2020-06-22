import 'package:everly/views/error_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import './views/splash_Screen.dart';
import './views/authentication/login_page.dart';
import './views/authentication/reset_password_page.dart';
import './views/authentication/signUp_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const Color orangeColor = const Color(0xFFF57C00);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Everly',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            labelStyle: GoogleFonts.montserrat(
                color: orangeColor, fontWeight: FontWeight.bold),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: orangeColor),
            )),
        primaryColor: orangeColor,
        accentColor: orangeColor,
        textSelectionHandleColor: orangeColor,
        textSelectionColor: orangeColor,
        scaffoldBackgroundColor: Colors.white,
        cursorColor: orangeColor,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: orangeColor, size: 40),
          textTheme: TextTheme(
            headline6: GoogleFonts.roboto(color: orangeColor, fontSize: 40),
            subtitle2: GoogleFonts.montserrat(color: Colors.black),
          ),
        ),
      ),
      routes: {
        '/': (context) => SplashScreen(),
        '/logInPage': (context) => LoginPage(),
        '/resetPasswordPage': (context) => ResetPasswordPage(),
        '/signUpPage': (context) => SignUpPage(),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => ErrorPage()),
      debugShowCheckedModeBanner: false,
    );
  }
}

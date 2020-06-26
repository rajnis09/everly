import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import './views/splash_Screen.dart';
import './views/authentication/signin_page.dart';
import './views/authentication/reset_password_page.dart';
import './views/authentication/signUp_email_or_phone_page.dart';
import './views/error_page.dart';

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
          ),
        ),
        primaryColor: orangeColor,
        accentColor: orangeColor,
        cursorColor: orangeColor,
        textSelectionHandleColor: orangeColor,
        textSelectionColor: orangeColor,
        scaffoldBackgroundColor: Colors.white,
        iconTheme: IconThemeData(color: orangeColor),
        textTheme: TextTheme(
          headline6:
              GoogleFonts.lato(color: orangeColor, fontWeight: FontWeight.bold),
          headline5: GoogleFonts.montserrat(
              color: orangeColor, fontWeight: FontWeight.bold),
        ),
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: orangeColor),
          actionsIconTheme: IconThemeData(color: orangeColor),
          textTheme: TextTheme(
            headline6: GoogleFonts.lato(
                color: orangeColor, fontWeight: FontWeight.bold, fontSize: 30),
            headline5: GoogleFonts.montserrat(
                color: orangeColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      routes: <String, WidgetBuilder>{
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

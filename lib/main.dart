import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';

import './views/splash_Screen.dart';
import './views/authentication/signin_page.dart';
import './views/authentication/reset_password_page.dart';
import './views/authentication/signUp_email_page.dart';
import './views/authentication/signUp_phone_page.dart';
import './views/error_page.dart';
import './views/intro_page.dart';
import './views/bottom_navigation_bar.dart';

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
        // Theming for the Formfields
        // Usage is by default
        // For modification purpose: Theme.of(context).inputDecorationTheme.copyWith(color: , rest all fields which you want to modify)
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

        // Theming for Normal Icons displayed on page
        // No need to define usage if default property to be used
        // Just modificaton: Theme.of(context).iconTheme.copyWit(color: , rest all fields which you want to modify)
        iconTheme: IconThemeData(color: orangeColor),

        // Theming for fonts displayed on page
        // Use headline6 for titles
        // use headline5 for rest of content
        // usage : Theme.of(context).textTheme.headline6 or Theme.of(context).textTheme.headline5
        // Modification: Theme.of(context).textTheme.headline6.copyWith(all fields which you want to modify)
        textTheme: TextTheme(
          headline6: GoogleFonts.lato(color: orangeColor, fontSize: 20.0),
          headline5: GoogleFonts.montserrat(color: orangeColor, fontSize: 20.0),
          headline4: GoogleFonts.robotoSlab(color: orangeColor, fontSize: 20.0),
        ),

        // Appbar theme
        // Usage is by default
        // In case need modification : Theme.of(context).appBarTheme.textTheme.headline6.copyWith(all fields which you want to modify)
        // or Theme.of(context).appBarTheme.iconTheme.copyWit(color: , rest all fields which you want to modify)
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
        '/signUpEmailPage': (context) => SignUpEmailPage(),
        '/signUpPhonePage': (context) => SignUpPhonePage(),
        '/introPage': (context) => IntroPage(),
        '/homePage': (context) => CustomBottomNavigationBar(),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => ErrorPage()),
      debugShowCheckedModeBanner: false,
    );
  }
}

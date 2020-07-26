import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './utils/theme/theme_data.dart';
import './views/splash_Screen.dart';
import './views/authentication/signin_page.dart';
import './views/add_shop_page.dart';
import './views/authentication/reset_password_page.dart';
import './views/authentication/signUp_email_page.dart';
import './views/authentication/signUp_phone_page.dart';
import './views/error_page.dart';
import './views/intro_page.dart';
import './views/bottom_navigation_bar.dart';
import './views/authentication/verify_email_page.dart';
import './views/my_cart.dart';
import './views/notification_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Everly',
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: CustomThemeData.robotoFont.copyWith(
              fontWeight: FontWeight.bold,
              color: CustomThemeData.blackColorShade2),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: CustomThemeData.buleColorShade2),
          ),
        ),
        cursorColor: CustomThemeData.buleColorShade2,
        textSelectionHandleColor: CustomThemeData.buleColorShade2,
        textSelectionColor: CustomThemeData.buleColorShade2,
        scaffoldBackgroundColor: Colors.white,
        accentColor: CustomThemeData.buleColorShade1,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          iconTheme: IconThemeData(color: CustomThemeData.blackColorShade2),
          actionsIconTheme:
              IconThemeData(color: CustomThemeData.blackColorShade2),
          textTheme: TextTheme(
            headline6: CustomThemeData.robotoFont.copyWith(
                color: CustomThemeData.blackColorShade1,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: CustomThemeData.buleColorShade1,
        ),
      ),
      routes: <String, WidgetBuilder>{
        '/': (context) => SplashScreen(),
        '/logInPage': (context) => LoginPage(),
        '/resetPasswordPage': (context) => ResetPasswordPage(),
        '/signUpEmailPage': (context) => SignUpEmailPage(),
        '/signUpPhonePage': (context) => SignUpPhonePage(),
        '/introPage': (context) => IntroScreen(),
        '/homePage': (context) => CustomBottomNavigationBar(),
        '/verifyEmailPage': (context) => VerifyEmailPage(),
        '/addShopPage': (context) => AddShopPage(),
        "/cartPage": (context) => CartPage(),
        '/notificationPage': (context) => NotificationPage(),
      },
      onUnknownRoute: (settings) =>
          MaterialPageRoute(builder: (context) => ErrorPage()),
      debugShowCheckedModeBanner: false,
    );
  }
}

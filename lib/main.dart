import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import './utils/theme/theme_data.dart';
import './views/splash_Screen.dart';
import './views/authentication/signin_page.dart';
import './views/add_shop_page.dart';
import './views/authentication/signUp_phone_page.dart';
import './views/error/error_page.dart';
import './views/intro_page.dart';
import './views/bottom_navigation_bar.dart';
import './views/my_cart.dart';
import './views/notification_page.dart';
import './views/settings/support.dart';
import './views/shop_details_page.dart';
import './views/profile/edit_profile_info.dart';
import './views/settings/about_page.dart';
import './views/orders/order_details_page.dart';
import './helpers/locale/app_localization.dart';
import './providers/connectivity_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppLocalizationDelegate _localizationDelegate =
      AppLocalizationDelegate(Locale('hi', 'IN'));

  void _changeToHindi() {
    setState(() {
      AppLocalization.load(Locale('hi', 'IN'));
    });
  }

  void _changeToEnglish() {
    setState(() {
      AppLocalization.load(Locale('en', 'US'));
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],
    );

    return MultiProvider(
      providers: [
        StreamProvider<ConnectionStatus>.value(
            value: ConnectivityService().connectivityController.stream),
      ],
      child: MaterialApp(
        title: 'Everly',
        localizationsDelegates: <LocalizationsDelegate>[
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          _localizationDelegate
        ],
        supportedLocales: <Locale>[
          const Locale.fromSubtags(
            languageCode: 'en',
            countryCode: 'US',
          ),
          const Locale.fromSubtags(
            languageCode: 'hi',
            countryCode: 'IN',
          ),
        ],
        theme: ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            labelStyle: CustomThemeData.robotoFont.copyWith(
                fontWeight: FontWeight.bold,
                color: CustomThemeData.blackColorShade2),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: CustomThemeData.blueColorShade2),
            ),
          ),
          cursorColor: CustomThemeData.blueColorShade2,
          textSelectionHandleColor: CustomThemeData.blueColorShade2,
          textSelectionColor: CustomThemeData.blueColorShade2,
          scaffoldBackgroundColor: Colors.white,
          accentColor: CustomThemeData.blueColorShade1,
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
            backgroundColor: CustomThemeData.blueColorShade1,
          ),
        ),
        routes: <String, WidgetBuilder>{
          '/': (context) => SplashScreen(),
          '/logInPage': (context) => LoginPage(),
          '/signUpPhonePage': (context) => SignUpPhonePage(),
          '/introPage': (context) => IntroScreen(),
          '/homePage': (context) => CustomBottomNavigationBar(
                changeToHindi: _changeToHindi,
                changeToEnglish: _changeToEnglish,
              ),
          '/addShopPage': (context) => AddShopPage(),
          "/cartPage": (context) => CartPage(),
          '/notificationPage': (context) => NotificationPage(),
          '/supportPage': (context) => SupportPage(),
          '/shopDetailsPage': (context) => ShopDetailsPage(),
          '/editprofileinfo': (context) => EditProfileInfoPage(),
          '/orderDetailsPage': (context) => OrderDetailsPage(),
          '/aboutPage': (context) => AboutPage(),
        },
        onUnknownRoute: (settings) =>
            MaterialPageRoute(builder: (context) => ErrorPage()),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

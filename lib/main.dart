import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:provider/provider.dart';

import './utils/theme/theme_data.dart';
import 'package:everly/views/home_page.dart';
import './views/splash_Screen.dart';
import './views/authentication/log_in_page.dart';
import './views/add_shop_page.dart';
import './views/authentication/signUp_phone_page.dart';
import './views/error/error_page.dart';
import './views/intro_page.dart';
import './views/my_cart.dart';
import './views/notification_page.dart';
import './views/settings/support.dart';
import './views/shop_details_page.dart';
import './views/profile/edit_profile_info.dart';
import './views/settings/about_page.dart';
import './views/orders/order_details_page.dart';
import './providers/connectivity_provider.dart';
import './utils/theme/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
    return MultiProvider(
      providers: [
        StreamProvider<ConnectionStatus>.value(
          value: ConnectivityService().connectivityController.stream,
        ),
      ],
      child: MaterialApp(
        title: 'Everly',
        theme: Themes.appTheme,
        routes: <String, WidgetBuilder>{
          '/': (context) => SplashScreen(),
          '/logInPage': (context) => LoginPage(),
          '/signUpPhonePage': (context) => SignUpPhonePage(),
          '/homePage': (context) => HomePage(),
          '/introPage': (context) => IntroScreen(),
          '/addShopPage': (context) => AddShopPage(),
          "/cartPage": (context) => CartPage(),
          '/notificationPage': (context) => NotificationPage(),
          '/supportPage': (context) => SupportPage(),
          '/shopDetailsPage': (context) => ShopDetailsPage(),
          '/editprofileinfo': (context) => EditProfileInfoPage(),
          '/orderDetailsPage': (context) => OrderDetailsPage(),
          '/aboutPage': (context) => AboutPage(),
        },
        onUnknownRoute: (settings) => MaterialPageRoute(
          builder: (context) => ErrorPage(),
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

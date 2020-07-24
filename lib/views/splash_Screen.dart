import 'package:flutter/material.dart';

import '../utils/theme/theme_data.dart';
import '../utils/auth/auth_handler.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key key,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    initializingApplication();
  }

  void initializingApplication() {
    Future.delayed(Duration(seconds: 2), () async {
       var user = await authHandler.getCurrentUser();
       if (user != null) {
         Navigator.pushReplacementNamed(context, '/homePage');
       } else {
         Navigator.pushReplacementNamed(context, '/logInPage');
       }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.maxHeight > constraints.maxWidth
              ? constraints.maxWidth
              : constraints.maxHeight;
          return Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: constraints.maxHeight / 2,
                ),
                Hero(
                  tag: 'splashLogoTag',
                  child: Container(
                    height: size * 0.5,
                    width: size * 0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/icon/logoWithoutBackground.png')),
                    ),
                  ),
                ),
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      CustomThemeData.buleColorShade1),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

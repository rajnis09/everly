import 'package:flutter/material.dart';

// import '../utils/theme/theme_data.dart';
// import '../helpers/locale/app_localization.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // var locale = AppLocalization.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Go back'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/404-page.png"),
              fit: BoxFit.contain),
        ),
      ),
    );
  }
}

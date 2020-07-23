import 'package:flutter/material.dart';

import '../utils/theme/theme_data.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Oops!! Some error occured',
          textScaleFactor: 1.5,
          style: CustomThemeData.latoFont.copyWith(
              fontWeight: FontWeight.bold, color: CustomThemeData.whiteColor),
        ),
      ),
    );
  }
}

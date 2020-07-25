import 'package:flutter/material.dart';

import '../utils/theme/theme_data.dart';
import '../helpers/locale/app_localization.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalization.of(context);
    return Scaffold(
      body: Center(
        child: Text(
          locale.errorText,
          textScaleFactor: 1.5,
          style: CustomThemeData.latoFont.copyWith(
              fontWeight: FontWeight.bold, color: CustomThemeData.whiteColor),
        ),
      ),
    );
  }
}

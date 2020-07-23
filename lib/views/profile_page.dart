import 'package:flutter/material.dart';

import '../utils/auth/auth_handler.dart';
import '../utils/theme/theme_data.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () async {
          // await authHandler.signOut();
          Navigator.pushNamedAndRemoveUntil(context, '/', (route) => false);
        },
        child: Text(
          'Logout',
          style: CustomThemeData.latoFont.copyWith(
              color: CustomThemeData.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        color: CustomThemeData.buleColorShade1,
      ),
    );
  }
}

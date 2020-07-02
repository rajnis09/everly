import 'dart:async';

import 'package:flutter/material.dart';

import '../../widgets/all_Alert_Dialogs.dart';
import '../../utils/auth/auth_handler.dart';

class VerifyEmailPage extends StatefulWidget {
  @override
  _VerifyEmailPageState createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  Timer _timer;

  @override
  void initState() {
    super.initState();

    Future(() async {
      var user = await authHandler.getCurrentUser();
      if (!user.isEmailVerified) {
        notificationDialog(context, 'Notification',
            'A link to verify your Email address is sent to the registered Email');
        await authHandler.sendVerificationLink();
      }
      _timer = Timer.periodic(Duration(seconds: 2), (timer) async {
        await authHandler.userReload();
        user = await authHandler.getCurrentUser();
        print('hello ${user.isEmailVerified}');
        if (user.isEmailVerified) {
          Navigator.pushReplacementNamed(context, '/introPage');
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 20),
            Text(
              'Verify your Email to Continue',
              textScaleFactor: 1.5,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) {
      _timer.cancel();
    }
  }
}

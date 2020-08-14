import 'package:flutter/material.dart';

import '../utils/theme/theme_data.dart';

// Dialog used to serve proper notification popups to user
notificationDialog(BuildContext context, String title, String notification) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          FlatButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              "OK",
              style: CustomThemeData.latoFont.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        content: Text(
          notification,
          style: CustomThemeData.latoFont.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    },
  );
}

Future<String> otpRetrieveDialog(BuildContext context) {
  TextEditingController _otpController = TextEditingController();
  String otp;
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Enter OTP recieved',
            style: CustomThemeData.latoFont.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: <Widget>[
            FlatButton(
              color: Theme.of(context).primaryColor,
              child: Text(
                "OK",
                style: CustomThemeData.latoFont.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                otp = _otpController.text;
                Navigator.of(context).pop();
                return otp;
              },
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          content: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: TextFormField(
              maxLength: 6,
              controller: _otpController,
              decoration: InputDecoration(
                labelText: 'OTP',
                counterText: '',
                prefixIcon: const Icon(Icons.lock),
              ),
              keyboardType: TextInputType.number,
              onSaved: (val) => otp = val,
            ),
          ),
        );
      });
  return Future.value(otp);
}

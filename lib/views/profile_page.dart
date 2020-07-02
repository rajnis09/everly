import 'package:everly/utils/auth/auth_handler.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        onPressed: () async {
          await authHandler.signOut();
          Navigator.pop(context);
        },
        child: Text(
          'Logout',
          style: Theme.of(context)
              .textTheme
              .headline6
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}

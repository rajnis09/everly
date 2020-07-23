import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import '../utils/theme/theme_data.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _message = 'hell';

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _register() {
    _firebaseMessaging.getToken().then((token) => print(token));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getMessage();
  }

  void getMessage() {
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('on message $message');
      setState(() => _message = message["notification"]["title"]);
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() => _message = message["notification"]["title"]);
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => _message = message["notification"]["title"]);
    });
  }

  bool isSwitched = false;
  bool _isSwitched = false;
  final _divider = Divider(
    color: CustomThemeData.greyColorShade,
    thickness: .5,
    indent: 8,
    endIndent: 8,
  );

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              _buildListitem(
                  context,
                  'Notification',
                  Icons.notifications_active,
                  Switch(
                    value: _isSwitched,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched = value;
                        print(_isSwitched);
                        if (isSwitched) _register();
                      });
                    },
                    activeTrackColor:
                        CustomThemeData.buleColorShade1.withOpacity(0.4),
                    activeColor: CustomThemeData.buleColorShade1,
                  ),
                  null),
              _divider,
              _buildListitem(
                  context, 'Help & Supoort', Icons.help, null, () {}),
              _divider,
              _buildListitem(
                  context, 'Rate App', Icons.rate_review, null, () {}),
              _divider,
              _buildListitem(context, 'Invite Friends', Icons.share, null, () {
                print('Friend Invited');
              }),
              _divider,
              _buildListitem(context, 'Terms and Service',
                  Icons.collections_bookmark, null, () {
                print('Terms and services');
              }),
              _divider,
              Text(_message),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildListitem(BuildContext context, String title, IconData iconData,
    Widget trailing, Function onPressed) {
  return Theme(
    data: ThemeData(
        splashColor: Colors.transparent, highlightColor: Colors.transparent),
    child: ListTile(
      leading: Icon(iconData, color: CustomThemeData.blackColorShade2),
      title: Text(
        title,
        style: CustomThemeData.latoFont.copyWith(
          color: CustomThemeData.blackColorShade2,
          fontSize: 18,
        ),
      ),
      trailing: trailing,
      onTap: onPressed,
    ),
  );
}

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

  bool _lang = true;
  bool _isSwitched = true;
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
                  _lang ? 'Notification' : 'सूचना प्राप्त करे',
                  Icons.notifications_active,
                  Switch(
                    value: _isSwitched,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched = value;
                        print(_isSwitched);
                        if (_isSwitched) _register();
                      });
                    },
                    activeTrackColor:
                        CustomThemeData.blueColorShade1.withOpacity(0.4),
                    activeColor: CustomThemeData.blueColorShade1,
                  ),
                  null),
              _divider,
              _buildListitem(
                  context,
                  _lang ? 'Change Language' : 'भाषा बदले',
                  Icons.language,
                  Text(
                    _lang ? 'हिन्दी' : 'English',
                    style: CustomThemeData.latoFont.copyWith(
                      color: CustomThemeData.blackColorShade2,
                      fontSize: 18,
                    ),
                  ), () {
                setState(() {
                  _lang = !_lang;
                });
              }),
              _divider,
              _buildListitem(
                  context,
                  _lang ? 'Help & Support' : 'सहायता और समर्थन',
                  Icons.help,
                  null,
                  () {}),
              _divider,
              _buildListitem(
                  context,
                  _lang ? 'Rate App' : 'एप्लिकेशन का मूल्यांकन करें',
                  Icons.rate_review,
                  null,
                  () {}),
              _divider,
              _buildListitem(
                  context,
                  _lang ? 'Invite Friends' : 'मित्रों को आमंत्रित करें',
                  Icons.share,
                  null, () {
                print('Friend Invited');
              }),
              _divider,
              _buildListitem(
                  context,
                  _lang ? 'Terms and Conditions' : 'नियम और शर्तें',
                  Icons.collections_bookmark,
                  null, () {
                print('Terms and Conditions');
              }),
              _divider,
              _buildListitem(
                  context,
                  _lang ? 'Privacy and Policy' : 'गोपनीयता और नीति',
                  Icons.library_books,
                  null, () {
                print('Privacy and Policies');
              }),
              _divider,
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

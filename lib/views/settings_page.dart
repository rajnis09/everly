import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart';

import '../utils/theme/theme_data.dart';
import '../helpers/locale/app_localization.dart';

class SettingsPage extends StatefulWidget {
  SettingsPage({
    this.changeToHindi,
    this.changeToEnglish,
  });

  final Function changeToHindi;
  final Function changeToEnglish;

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  static const platform = MethodChannel("com.unmount.everly/channel");

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  void _invite() async {
    try {
      var result = await platform.invokeMethod("invite") as bool;
      print(result);
    } on PlatformException catch(ignored) {
      print(ignored);
    }
  }

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
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
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
    var locale = AppLocalization.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              _buildListItem(
                  context,
                  locale.notification,
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
              _buildListItem(
                  context,
                  locale.changeLanguage,
                  Icons.language,
                  Text(
                    locale.lang,
                    style: CustomThemeData.latoFont.copyWith(
                      color: CustomThemeData.blackColorShade2,
                      fontSize: 18,
                    ),
                  ), () {
                setState(() {
                  _lang = !_lang;
                });
                _lang ? widget.changeToEnglish() : widget.changeToHindi();
              }),
              _divider,
<<<<<<< HEAD
              _buildListItem(context, locale.help, Icons.help, null, () {
=======
              _buildListitem(context, locale.help, Icons.help, null, () {
>>>>>>> 4309f899d6c14334b647fa698973360a0d2dd09b

                // TODO: Remove this route
                // this routing is for testing purpose only
                Navigator.pushNamed(context, '/logInPage');
              }),
              _divider,
<<<<<<< HEAD
              _buildListItem(
                  context, locale.rate, Icons.rate_review, null, () {}),
              _divider,
              _buildListItem(context, locale.invite, Icons.share, null, () {
                _invite();
              }),
              _divider,
              _buildListItem(
=======
              _buildListitem(
                  context, locale.rate, Icons.rate_review, null, () {}),
              _divider,
              _buildListitem(context, locale.invite, Icons.share, null, () {
                print('Friend Invited');
              }),
              _divider,
              _buildListitem(
>>>>>>> 4309f899d6c14334b647fa698973360a0d2dd09b
                  context, locale.tnc, Icons.collections_bookmark, null, () {
                print('Terms and Conditions');
              }),
              _divider,
<<<<<<< HEAD
              _buildListItem(context, locale.privacy, Icons.library_books, null,
=======
              _buildListitem(context, locale.privacy, Icons.library_books, null,
>>>>>>> 4309f899d6c14334b647fa698973360a0d2dd09b
                  () {
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

Widget _buildListItem(BuildContext context, String title, IconData iconData,
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

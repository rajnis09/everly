import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/theme/theme_data.dart';
import '../../widgets/build_list_items.dart';
import '../../helpers/locale/app_localization.dart';

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

  void _invite() async {
    try {
      var result = await platform.invokeMethod("invite") as bool;
      print(result);
    } on PlatformException catch (ignored) {
      print(ignored);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  bool _lang = true;
  bool _isSwitched = true;

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalization.of(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              buildListItem(
                  context,
                  locale.notification,
                  Icons.notifications_active,
                  Switch(
                    value: _isSwitched,
                    onChanged: (value) {
                      setState(() {
                        _isSwitched = value;
                        print(_isSwitched);
                      });
                    },
                    activeTrackColor:
                        CustomThemeData.blueColorShade1.withOpacity(0.4),
                    activeColor: CustomThemeData.blueColorShade1,
                  ),
                  null,
                  size.height * 0.025),
              divider,
              buildListItem(
                  context,
                  locale.changeLanguage,
                  Icons.language,
                  Text(
                    locale.lang,
                    style: CustomThemeData.latoFont.copyWith(
                      color: CustomThemeData.blackColorShade2,
                      fontSize: size.height * 0.025,
                    ),
                  ), () {
                setState(() {
                  _lang = !_lang;
                });
                _lang ? widget.changeToEnglish() : widget.changeToHindi();
              }, size.height * 0.025),
              divider,
              buildListItem(context, locale.help, Icons.help, null, () {
                Navigator.pushNamed(context, '/supportPage');
              }, size.height * 0.025),
              divider,
              buildListItem(context, locale.rate, Icons.rate_review, null,
                  () {}, size.height * 0.025),
              divider,
              buildListItem(context, locale.invite, Icons.share, null, () {
                _invite();
              }, size.height * 0.025),
              divider,
              buildListItem(
                  context, locale.tnc, Icons.collections_bookmark, null, () {
                print('Terms and Conditions');
              }, size.height * 0.025),
              divider,
              buildListItem(context, locale.privacy, Icons.library_books, null,
                  () {
                print('Privacy and Policies');
              }, size.height * 0.025),
              divider,
              buildListItem(context, 'About', Icons.info, null, () {
                Navigator.pushNamed(context, '/aboutPage');
              }, size.height * 0.025),
              divider,
            ],
          ),
        ),
      ),
    );
  }
}

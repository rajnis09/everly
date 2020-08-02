import 'package:flutter/material.dart';

import '../utils/theme/theme_data.dart';

Widget buildListItem(BuildContext context, String title, IconData iconData,
    Widget trailing, Function onPressed, double fontSize) {
  return Theme(
    data: ThemeData(
        splashColor: Colors.transparent, highlightColor: Colors.transparent),
    child: ListTile(
      leading: Icon(iconData, color: CustomThemeData.blackColorShade2),
      title: Text(
        title,
        style: CustomThemeData.latoFont.copyWith(
          color: CustomThemeData.blackColorShade2,
          fontSize: fontSize,
        ),
      ),
      trailing: trailing,
      onTap: onPressed,
    ),
  );
}

final divider = Divider(
  color: CustomThemeData.greyColorShade,
  thickness: .5,
  indent: 8,
  endIndent: 8,
);

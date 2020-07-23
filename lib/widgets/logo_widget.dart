import 'package:everly/utils/theme/theme_data.dart';
import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final size;

  const LogoWidget({Key key, this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'splashLogoTag',
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          // color: CustomThemeData.blackColorShade3,
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/icon/logo.png'),
          ),
        ),
      ),
    );
  }
}

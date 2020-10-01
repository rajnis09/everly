import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final size;

  const LogoWidget({Key key, this.size}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final siz = size ?? 160.0;
    return Hero(
      tag: 'splashLogoTag',
      child: Card(
        elevation: 6.0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(siz / 2)),
        child: Container(
          height: siz,
          width: siz,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage('assets/icon/anitiQNobg.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

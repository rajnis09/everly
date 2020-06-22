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
          color: Colors.orange[50],
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/icon/logo.png'),
          ),
        ),
      ),
    );
  }
}

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
          // color: Colors.black54,
          // gradient: LinearGradient(
          //   begin: Alignment.topLeft,
          //   end: Alignment(0.8, 0.0),
          //   colors: [const Color(0xff232526), const Color(0xff414345)],
          //   // tileMode: TileMode.repeated,
          // ),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/icon/logo.png'),
          ),
        ),
      ),
    );
  }
}

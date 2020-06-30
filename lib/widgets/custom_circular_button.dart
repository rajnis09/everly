import 'package:flutter/material.dart';

class CustomCicularButton extends StatelessWidget {
  final double height;
  final Color backgroundColor, splashColor;
  final Function onPressed;
  final Widget child;

  const CustomCicularButton({
    Key key,
    @required this.height,
    this.backgroundColor = const Color(0xFFF57C00),
    @required this.onPressed,
    this.splashColor = Colors.white30,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.0,
      child: MaterialButton(
        shape: CircleBorder(),
        splashColor: splashColor,
        onPressed: onPressed,
        color: backgroundColor,
        elevation: 5.0,
        child: Center(
          child: child,
        ),
      ),
    );
  }
}








import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Oops!! Some error occured',
          textScaleFactor: 1.5,
          style: TextStyle(color: const Color(0xFFF57C00)),
        ),
      ),
    );
  }
}

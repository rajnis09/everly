import 'package:flutter/material.dart';
import './app_intro_view.dart';

class IntroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          color: Theme.of(context).accentColor,
          margin: EdgeInsets.all(15),
          child: MyIntroView(
            pages: <Widget>[
              Image.asset("assets/images/1.png", fit: BoxFit.fill),
              Image.asset("assets/images/2.png", fit: BoxFit.fill),
              Image.asset("assets/images/3.png", fit: BoxFit.fill),
              Image.asset("assets/images/4.png", fit: BoxFit.fill),
            ],
            onIntroCompleted: () {
              Navigator.pushReplacementNamed(context, '/homePage');
            },
          ),
        ),
      ),
    );
  }
}

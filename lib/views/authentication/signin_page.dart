import 'package:flutter/material.dart';

import '../../widgets/cubic_clipper.dart';
import '../../utils/forms/sign_in_form.dart';
import '../../widgets/logo_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Welcome to Everly :)'),
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.40),
              color: Colors.orange[50],
              height: size.height * 0.60,
              child: ClipPath(
                clipper: CubicClipper(),
                child: Container(
                  height: size.height * 1,
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(kToolbarHeight - 25),
                  height: size.height * 0.20,
                  alignment: Alignment.center,
                  child: LogoWidget(
                    size: size.width * 0.4,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  alignment: Alignment.centerLeft,
                  height: size.height * 0.06,
                  child: Text(
                    'LogIn',
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Colors.orange[700],
                        fontSize: size.height * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SignInForm(),
                SizedBox(
                  height: 1,
                ),
                Container(
                  width: size.width * 0.7,
                  height: size.height * 0.04,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      )),
                      SizedBox(width: 5),
                      Text(
                        'OR',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .copyWith(fontSize: 16),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                          child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.width * 0.05,
                ),
                Container(
                  child: GestureDetector(
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                          color: Colors.orange[700],
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    onTap: () => Navigator.pushNamed(context, '/signUpPage'),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
              ],
            ),
          ],
        ),),
      ),
    );
  }
}

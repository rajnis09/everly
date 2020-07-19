import 'package:flutter/material.dart';

import '../../widgets/custom_circular_button.dart';
import '../../widgets/all_Alert_Dialogs.dart';
import '../auth/auth_handler.dart';
import './form_validator.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  String _email, _password;
  bool _autoValidate = false, _obscureText = true, _isNetworkCall = false;
  IconData iconData = Icons.visibility_off;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  labelText: 'Email or phone',
                ),
                validator: validator.validateEmail,
                onSaved: (val) => _email = val,
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: size.height * 0.01),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                      icon: Icon(iconData),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                          iconData = _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility;
                        });
                      }),
                  labelText: 'Password',
                ),
                obscureText: _obscureText,
                onSaved: (val) => _password = val,
              ),
              SizedBox(height: size.height * 0.01),
              Container(
                alignment: Alignment(1.0, 0.0),
                padding: EdgeInsets.only(top: 4.0),
                child: GestureDetector(
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: size.width * 0.042,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () =>
                      Navigator.pushNamed(context, '/resetPasswordPage'),
                  onDoubleTap: () {},
                ),
              ),
              SizedBox(height: size.height * 0.015),
              _isNetworkCall
                  ? Container(
                      height: size.height * 0.1,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    )
                  : CustomCicularButton(
                      height: size.height * 0.08,
                      splashColor: Theme.of(context).primaryColor,
                      child: Icon(
                        Icons.keyboard_arrow_right,
                        size: size.height * 0.08,
                        color: Colors.white,
                      ),
                      onPressed: () async {
                        FocusScope.of(context).unfocus();
                        if (_formKey.currentState.validate()) {
                          setState(() {
                            _isNetworkCall = true;
                          });
                          _formKey.currentState.save();
                          int response = await authHandler.handleSignInEmail(
                              _email, _password);
                          switch (response) {
                            case 0:
                              Navigator.pushReplacementNamed(
                                  context, '/homePage');
                              break;
                            case 1:
                              notificationDialog(context, 'Error',
                                  'Either email or password is incorrect');
                              break;
                            case 2:
                              notificationDialog(
                                  context, 'Error', 'User does not found');
                              break;
                            case 3:
                              notificationDialog(context, 'Error',
                                  'Too many requests, try after sometime');
                              break;
                            default:
                              notificationDialog(
                                context,
                                'Error',
                                'Contact Everly team by filling feedback form',
                              );
                          }
                          await Future.delayed(Duration(milliseconds: 100));
                          setState(() {
                            _isNetworkCall = false;
                          });
                        } else {
                          setState(() {
                            _autoValidate = true;
                          });
                        }
                      },
                    ),
              SizedBox(height: size.height * 0.015),
            ],
          ),
        ),
      ),
    );
  }
}

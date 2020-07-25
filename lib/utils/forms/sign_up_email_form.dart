import 'package:flutter/material.dart';

import '../../utils/theme/theme_data.dart';
import '../../widgets/custom_circular_button.dart';
import '../auth/auth_handler.dart';
import './form_validator.dart';
import '../../widgets/all_Alert_Dialogs.dart';
import '../../helpers/locale/app_localization.dart';

class SignUpWithEmailForm extends StatefulWidget {
  @override
  _SignUpWithEmailFormState createState() => _SignUpWithEmailFormState();
}

class _SignUpWithEmailFormState extends State<SignUpWithEmailForm> {
  String _email, _password, _firstName, _lastName;
  bool _autoValidate = false, _obscureText = true, _isNetworkCall = false;
  IconData iconData = Icons.visibility_off;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final locale = AppLocalization.of(context);

    return Container(
      child: Form(
        key: _formKey,
        autovalidate: _autoValidate,
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: locale.firstName,
                      prefixIcon: Icon(Icons.person,
                          color: CustomThemeData.blackColorShade2),
                    ),
                    validator: validator.validateName,
                    onSaved: (val) => _firstName = val,
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: locale.lastName,
                      prefixIcon: Icon(Icons.person,
                          color: CustomThemeData.blackColorShade2),
                    ),
                    validator: validator.validateName,
                    onSaved: (val) => _lastName = val,
                    keyboardType: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: locale.email,
                      prefixIcon: Icon(Icons.email,
                          color: CustomThemeData.blackColorShade2),
                    ),
                    validator: validator.validateEmail,
                    onSaved: (val) => _email = val,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: locale.pass,
                      prefixIcon: Icon(Icons.lock,
                          color: CustomThemeData.blackColorShade2),
                      suffixIcon: IconButton(
                          icon: Icon(iconData,
                              color: CustomThemeData.blackColorShade2),
                          onPressed: () {
                            setState(() {
                              _obscureText = !_obscureText;
                              iconData = _obscureText
                                  ? Icons.visibility_off
                                  : Icons.visibility;
                            });
                          }),
                    ),
                    obscureText: _obscureText,
                    keyboardType: TextInputType.text,
                    validator: validator.validatePassword,
                    onSaved: (val) => _password = val,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: locale.confirmPassword,
                      prefixIcon: Icon(Icons.lock,
                          color: CustomThemeData.blackColorShade2),
                    ),
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    validator: validator.validateConfirmPassword,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                _isNetworkCall
                    ? Container(
                        height: size.height * 0.1,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      )
                    : CustomCicularButton(
                        height: size.height * 0.1,
                        splashColor: CustomThemeData.blueColorShade2,
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
                            int response = await authHandler.handleSignUp(
                                _email,
                                _password,
                                _firstName + ' ' + _lastName,
                                null);
                            switch (response) {
                              case 0:
                                Navigator.pushReplacementNamed(
                                    context, '/verifyEmailPage');
                                break;
                              case 1:
                                notificationDialog(
                                    context, locale.error, locale.invalidEmail);
                                break;
                              case 2:
                                notificationDialog(
                                    context, locale.error, 'Password is weak');
                                break;
                              case 3:
                                notificationDialog(context, locale.error,
                                    'The Email is already in use');
                                break;
                              default:
                                notificationDialog(context, locale.error,
                                    locale.defaultFeedbackText);
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
                SizedBox(height: size.height * 0.02),
              ],
            )),
      ),
    );
  }
}

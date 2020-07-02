import 'package:flutter/material.dart';

import '../../widgets/custom_circular_button.dart';
import '../../widgets/all_Alert_Dialogs.dart';
import '../auth/auth_handler.dart';
import './form_validator.dart';

class SignUpWithPhoneForm extends StatefulWidget {
  @override
  _SignUpWithPhoneFormState createState() => _SignUpWithPhoneFormState();
}

class _SignUpWithPhoneFormState extends State<SignUpWithPhoneForm> {
  String _phoneNumber, _firstName, _lastName;
  bool _autoValidate = false, _isNetworkCall = false, _isOtpSent = false;
  IconData iconData = Icons.visibility_off;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          Form(
            key: _formKey,
            autovalidate: _autoValidate,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      enabled: !_isOtpSent,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        prefixIcon: const Icon(Icons.person),
                        labelStyle: _isOtpSent
                            ? Theme.of(context)
                                .inputDecorationTheme
                                .labelStyle
                                .copyWith(color: Colors.grey)
                            : Theme.of(context).inputDecorationTheme.labelStyle,
                      ),
                      validator: validator.validateName,
                      onSaved: (val) => _firstName = val,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      enabled: !_isOtpSent,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        prefixIcon: const Icon(Icons.person),
                        labelStyle: _isOtpSent
                            ? Theme.of(context)
                                .inputDecorationTheme
                                .labelStyle
                                .copyWith(color: Colors.grey)
                            : Theme.of(context).inputDecorationTheme.labelStyle,
                      ),
                      validator: validator.validateName,
                      onSaved: (val) => _lastName = val,
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: TextFormField(
                      enabled: !_isOtpSent,
                      maxLength: 10,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        prefixText: '+91',
                        counterText: '',
                        prefixIcon: const Icon(Icons.phone),
                        labelStyle: _isOtpSent
                            ? Theme.of(context)
                                .inputDecorationTheme
                                .labelStyle
                                .copyWith(color: Colors.grey)
                            : Theme.of(context).inputDecorationTheme.labelStyle,
                      ),
                      validator: validator.validateNumber,
                      onSaved: (val) => _phoneNumber = val,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  _isNetworkCall
                      ? Container(
                          height: size.height * 0.056,
                          margin: EdgeInsets.only(top: size.height * 0.05),
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        )
                      : Container(
                          margin: EdgeInsets.only(top: size.height * 0.02),
                          child: CustomCicularButton(
                            height: size.height * 0.1,
                            splashColor: Colors.orangeAccent,
                            child: Icon(
                              Icons.keyboard_arrow_right,
                              size: size.height * 0.08,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              FocusScope.of(context).unfocus();
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  _isOtpSent = true;
                                  _isNetworkCall = true;
                                });
                                _formKey.currentState.save();
                                _phoneNumber = '+91' + _phoneNumber;
                                print(_phoneNumber);
                                // int response =
                                //     await authHandler.signInWithPhone(
                                //   _firstName + ' ' + _lastName,
                                //   _phoneNumber,
                                // );
                                // print('Response $response');
                                // switch (response) {
                                //   case 0:
                                //     Navigator.pushReplacementNamed(
                                //         context, '/homePage');
                                //     break;
                                //   case 1:
                                //     Navigator.pushReplacementNamed(
                                //         context, '/introPage');
                                //     break;
                                //   case 2:
                                //     notificationDialog(context, 'Error',
                                //         'Account already Exists');
                                //     break;
                                //   case 3:
                                //     notificationDialog(context, 'Error',
                                //         'Invalid Credentials');
                                //     break;
                                //   default:
                                //     notificationDialog(context, 'Error',
                                //         'Contact Everly team by filling feedback form');
                                // }
                                notificationDialog(context, 'Error',
                                    'For some reason phone authentication is disabled for now');
                                await Future.delayed(
                                    Duration(milliseconds: 100));
                                setState(() {
                                  _isOtpSent = false;
                                  _isNetworkCall = false;
                                });
                              } else {
                                setState(() {
                                  _autoValidate = true;
                                });
                              }
                            },
                          ),
                        )
                ],
              ),
            ),
          ),
          SizedBox(height: size.height * 0.015),
        ],
      ),
    );
  }
}

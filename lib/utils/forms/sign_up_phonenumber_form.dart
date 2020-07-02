import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';
import '../../widgets/custom_circular_button.dart';
import 'form_validator.dart';

class SignUpWithPhoneForm extends StatefulWidget {
  @override
  _SignUpWithPhoneFormState createState() => _SignUpWithPhoneFormState();
}

class _SignUpWithPhoneFormState extends State<SignUpWithPhoneForm> {
  String _phoneNumber, _otp, _firstName, _lastName;
  bool _autoValidate = false, _isNetworkCall = false, _isOtpSent = false;
  IconData iconData = Icons.visibility_off;
  TextEditingController _otpController = TextEditingController();
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
                  !_isOtpSent
                      ? _isNetworkCall
                          ? Container(
                              height: size.height * 0.056,
                              margin: EdgeInsets.only(top: size.height * 0.05),
                              alignment: Alignment.center,
                              child: CircularProgressIndicator(),
                            )
                          : Container(
                              margin: EdgeInsets.only(top: size.height * 0.05),
                              child: CustomButton(
                                height: size.height * 0.056,
                                width: size.width * 0.4,
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontSize: size.width * 0.05,
                                      color: Colors.white),
                                ),
                                onPressed: () async {
                                  FocusScope.of(context).unfocus();
                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      _isNetworkCall = true;
                                    });
                                    _formKey.currentState.save();

                                    // Delay to mock as network call
                                    await Future.delayed(
                                        Duration(milliseconds: 2000));

                                    // Dialog box to display Form data we recieved
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            content: Text(
                                                'Name: $_firstName $_lastName\nPhone Number : $_phoneNumber'),
                                          );
                                        });

                                    setState(() {
                                      _isNetworkCall = false;
                                      _isOtpSent = true;
                                    });
                                  } else {
                                    setState(() {
                                      _autoValidate = true;
                                    });
                                  }
                                },
                              ),
                            )
                      : Container(),
                ],
              ),
            ),
          ),
          _isOtpSent
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextFormField(
                    onFieldSubmitted: (value) {
                      _otp = _otpController.text;
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                  'Verfied\nName: $_firstName $_lastName\nPhone Number : $_phoneNumber\nOTP: $_otp'),
                            );
                          });
                    },
                    maxLength: 6,
                    controller: _otpController,
                    decoration: InputDecoration(
                      labelText: 'OTP',
                      counterText: '',
                      prefixIcon: const Icon(Icons.lock),
                    ),
                    keyboardType: TextInputType.number,
                    onSaved: (val) => _otp = val,
                  ),
                )
              : Container(),
          _isOtpSent
              ? Container(
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  child: IconButton(
                      icon: Icon(Icons.refresh, size: 30),
                      onPressed: () {
                        setState(() {
                          _formKey.currentState.reset();
                          _isOtpSent = false;
                          _otpController.clear();
                          _autoValidate = false;
                        });
                      }))
              : Container(),
          _isOtpSent
              ? _isNetworkCall
                  ? Container(
                      height: size.height * 0.1,
                      margin: EdgeInsets.only(top: size.height * 0.02),
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
                          setState(() {
                            _isNetworkCall = true;
                          });
                          _otp = _otpController.text;
                          // Delay to mock as network call
                          await Future.delayed(Duration(milliseconds: 1000));

                          // Dialog box to display Form data we recieved

                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Text(
                                      'Name: $_firstName $_lastName\nPhone Number : $_phoneNumber\n OTP: $_otp'),
                                );
                              });

                          setState(() {
                            _isNetworkCall = false;
                          });
                          Navigator.pushNamed(context, '/introPage');
                        },
                      ),
                    )
              : Container(),
          SizedBox(height: size.height * 0.015),
        ],
      ),
    );
  }
}

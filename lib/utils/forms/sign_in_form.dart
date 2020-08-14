import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

import './form_validator.dart';
import '../auth/auth_handler.dart';
import '../../widgets/all_Alert_Dialogs.dart';
import '../../widgets/custom_button.dart';
import '../../utils/theme/theme_data.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  String _phoneNumber, _code = '';
  bool _autoValidate = false, _isNetworkCall = false;
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();
  FocusNode focusNode4 = FocusNode();
  FocusNode focusNode5 = FocusNode();
  FocusNode focusNode6 = FocusNode();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void phoneNumberLogin(BuildContext context, final size) async {
    int response = 0;
    await authHandler.auth.verifyPhoneNumber(
      phoneNumber: _phoneNumber,
      timeout: Duration(seconds: 60),
      verificationCompleted: (AuthCredential credential) async {
        print('verified');
        Navigator.of(context).pop();
        response = await authHandler.phoneUserLoginOrRegister(credential);
        print('Response is in verification completed $response');
        _code = '';
        switch (response) {
          case 0:
            Navigator.pushReplacementNamed(context, '/homePage');
            break;
          case 1:
            Navigator.pushReplacementNamed(context, '/introPage');
            break;
          case 2:
            notificationDialog(context, 'Error',
                'The Account exists with different credentials');
            break;
          case 3:
            notificationDialog(context, 'Error', 'Invalid Credentials');
            break;
          case 4:
            notificationDialog(context, 'Error',
                'The Account is disabled\nContact support team');
            break;
          case 5:
            notificationDialog(
                context, 'Error', 'This operation is not allowed');
            break;
          case 6:
            notificationDialog(
                context, 'Error', 'The operation code is invalid');
            break;
          case 8:
            notificationDialog(context, 'Error',
                'Phone Number verification failed, Try later');
            break;
          default:
            notificationDialog(context, 'Error', 'Contact support team');
            break;
        }
        setState(() {
          _isNetworkCall = false;
        });
      },
      verificationFailed: (AuthException exception) async {
        print(
            'Phone Number Verification failed with ${exception.code} and ${exception.message}');
        notificationDialog(context, 'Error',
            'Phone Number verification failed \n${exception.message}');
        setState(() {
          _isNetworkCall = false;
        });
      },
      codeSent: (String verificationId, [int forceResendingToken]) async {
        print('code sent');

        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                height: size.height * 0.3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(width: 16.0),
                          Expanded(
                            child: RichText(
                              text: TextSpan(
                                children: <InlineSpan>[
                                  TextSpan(
                                    text: 'Please enter the ',
                                    style: CustomThemeData.latoFont.copyWith(
                                      color: CustomThemeData.blackColorShade2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'One Time Password',
                                    style: CustomThemeData.latoFont.copyWith(
                                      color: CustomThemeData.blackColorShade2,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' sent to your mobile',
                                    style: CustomThemeData.latoFont.copyWith(
                                      color: CustomThemeData.blackColorShade2,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16.0),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          otpField(context, "1", focusNode1),
                          SizedBox(width: 5.0),
                          otpField(context, "2", focusNode2),
                          SizedBox(width: 5.0),
                          otpField(context, "3", focusNode3),
                          SizedBox(width: 5.0),
                          otpField(context, "4", focusNode4),
                          SizedBox(width: 5.0),
                          otpField(context, "5", focusNode5),
                          SizedBox(width: 5.0),
                          otpField(context, "6", focusNode6),
                          SizedBox(width: 5.0),
                        ],
                      ),
                      SizedBox(height: size.height * 0.04 * 1.5),
                      Container(
                        child: CustomButton(
                          height: size.height * 0.055,
                          width: size.width * 0.7,
                          onPressed: () async {
                            FocusScope.of(context).unfocus();
                            print('In verification');
                            print('code is $_code');
                            AuthCredential credential =
                                PhoneAuthProvider.getCredential(
                              verificationId: verificationId,
                              smsCode: _code,
                            );
                            response = await authHandler
                                .phoneUserLoginOrRegister(credential);
                            Navigator.of(context).pop();
                            print('Response is $response');
                            switch (response) {
                              case 0:
                                Navigator.pushReplacementNamed(
                                    context, '/homePage');
                                break;
                              case 1:
                                Navigator.pushReplacementNamed(
                                    context, '/introPage');
                                break;
                              case 2:
                                notificationDialog(context, 'Error',
                                    'The Account exists with different credentials');
                                break;
                              case 3:
                                notificationDialog(
                                    context, 'Error', 'Invalid Credentials');
                                break;
                              case 4:
                                notificationDialog(context, 'Error',
                                    'The Account is disabled\nContact support team');
                                break;
                              case 5:
                                notificationDialog(context, 'Error',
                                    'This operation is not allowed');
                                break;
                              case 6:
                                notificationDialog(context, 'Error',
                                    'The operation code is invalid');
                                break;
                              case 8:
                                notificationDialog(context, 'Error',
                                    'Phone Number verification failed, Try later');
                                break;
                              default:
                                notificationDialog(
                                    context, 'Error', 'Contact support team');
                                break;
                            }
                            setState(() {
                              _isNetworkCall = false;
                            });
                          },
                          child: Center(
                            child: Text(
                              'VERIFY',
                              style: CustomThemeData.robotoFont.copyWith(
                                fontSize: size.width * 0.038,
                                color: CustomThemeData.whiteColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      codeAutoRetrievalTimeout: null,
    );
  }

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
                maxLength: 10,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: CustomThemeData.blackColorShade2,
                  ),
                  prefixText: '+91',
                  counterText: '',
                  // TODO: ADD locale for Phone number
                  labelText: 'Phone Number',
                ),
                validator: validator.validateNumber,
                onSaved: (val) => _phoneNumber = val,
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: size.height * 0.03),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(width: size.height * 0.025),
                  Icon(
                    Icons.info,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        children: <InlineSpan>[
                          TextSpan(
                            text: 'We will send ',
                            style: CustomThemeData.latoFont.copyWith(
                              color: CustomThemeData.blackColorShade2,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: 'One Time Password',
                            style: CustomThemeData.latoFont.copyWith(
                              color: CustomThemeData.blackColorShade2,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: ' to this mobile number',
                            style: CustomThemeData.latoFont.copyWith(
                              color: CustomThemeData.blackColorShade2,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: size.height * 0.025),
                ],
              ),
              SizedBox(height: size.height * 0.025 * 1.5),
              _isNetworkCall
                  ? Container(
                      height: size.height * 0.055,
                      alignment: Alignment.center,
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      child: CustomButton(
                        height: size.height * 0.055,
                        width: size.width * 0.7,
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState.validate()) {
                            setState(() {
                              _isNetworkCall = true;
                            });
                            _formKey.currentState.save();
                            _phoneNumber = '+91$_phoneNumber';
                            phoneNumberLogin(context, size);
                          } else {
                            setState(() {
                              _autoValidate = true;
                            });
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.mail,
                              size: size.height * 0.038,
                              color: CustomThemeData.whiteColor,
                            ),
                            SizedBox(
                              width: size.width * 0.02,
                            ),
                            Text(
                              'SEND OTP',
                              style: CustomThemeData.robotoFont.copyWith(
                                fontSize: size.width * 0.038,
                                color: CustomThemeData.whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
              SizedBox(height: size.height * 0.015),
            ],
          ),
        ),
      ),
    );
  }

  Widget otpField(BuildContext context, String key, FocusNode focusNode) {
    return SizedBox(
      height: 40.0,
      width: 35.0,
      child: TextField(
        key: Key(key),
        expands: false,
        autofocus: false,
        focusNode: focusNode,
        onChanged: (String value) {
          if (value.length == 1) {
            _code += value;
            switch (_code.length) {
              case 1:
                FocusScope.of(context).requestFocus(focusNode2);
                break;
              case 2:
                FocusScope.of(context).requestFocus(focusNode3);
                break;
              case 3:
                FocusScope.of(context).requestFocus(focusNode4);
                break;
              case 4:
                FocusScope.of(context).requestFocus(focusNode5);
                break;
              case 5:
                FocusScope.of(context).requestFocus(focusNode6);
                break;
              default:
                FocusScope.of(context).requestFocus(FocusNode());
                break;
            }
          }
        },
        maxLengthEnforced: false,
        textAlign: TextAlign.center,
        cursorColor: Colors.white,
        keyboardType: TextInputType.number,
        style: CustomThemeData.montserratFont.copyWith(
          fontSize: 20.0,
          fontWeight: FontWeight.w600,
          color: CustomThemeData.blueColorShade2,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 4.0,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Colors.blueAccent,
              width: 2.25,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

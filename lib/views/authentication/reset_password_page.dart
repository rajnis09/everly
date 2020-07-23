import 'package:flutter/material.dart';


import '../../utils/theme/theme_data.dart';
import '../../widgets/logo_widget.dart';
import '../../utils/forms/form_validator.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/all_Alert_Dialogs.dart';
import '../../utils/auth/auth_handler.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  String _email;
  bool _autoValidate = false, _isNetworkCall = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.all(kToolbarHeight),
                  height: size.height * 0.20,
                  alignment: Alignment.center,
                  child: LogoWidget(
                    size: size.width * 0.4,
                  ),
                ),
                Column(
                  children: <Widget>[
                    FittedBox(
                      child: Text(
                        'Forgot Password?',
                        style: CustomThemeData.robotoFont.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: CustomThemeData.blackColorShade1,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: size.width * 0.7,
                      child: Text(
                        'Please enter your registered email to reset your password',
                        style: CustomThemeData.latoFont.copyWith(
                          fontSize: 16,
                          color: CustomThemeData.blackColorShade2,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: size.width <= 400
                          ? size.width * 0.8
                          : size.width * 0.7,
                      child: Form(
                        key: _formKey,
                        autovalidate: _autoValidate,
                        child: TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.email, color: CustomThemeData.blackColorShade2,),
                            labelText: 'Email',
                          ),
                          validator: validator.validateEmail,
                          onSaved: (val) => _email = val,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height* 0.03,
                    ),
                    _isNetworkCall
                        ? Container(
                            height: size.height * 0.05,
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          )
                        : CustomButton(
                            height: size.height * 0.06,
                            child: Text(
                              'Reset Password',
                              style: CustomThemeData.robotoFont.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                setState(() {
                                  _isNetworkCall = true;
                                });
                                _formKey.currentState.save();
                                FocusScope.of(context).unfocus();
                                int response = await authHandler
                                    .sendPasswordResetLink(_email);
                                switch (response) {
                                  case 0:
                                    notificationDialog(
                                        context,
                                        'Notification',
                                        'A link to reset your password is sent to your email address');
                                    break;
                                  case 1:
                                    notificationDialog(
                                        context, 'Error', 'Invalid Email');
                                    break;
                                  case 2:
                                    notificationDialog(context, 'Error',
                                        'User not found.');
                                    break;
                                  default:
                                    notificationDialog(
                                      context,
                                      'Error',
                                      'Contact Everly team by filling feedback form',
                                    );
                                }
                                await Future.delayed(
                                    Duration(milliseconds: 100));
                                setState(() {
                                  _isNetworkCall = false;
                                });
                              } else {
                                setState(() {
                                  _autoValidate = true;
                                });
                              }
                            }),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

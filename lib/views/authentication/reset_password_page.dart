import 'package:flutter/material.dart';

import '../../widgets/logo_widget.dart';
import '../../utils/forms/form_validator.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/cubic_clipper.dart';
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
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: size.height * 0.4,
              ),
              color: Colors.orange[50],
              height: size.height * 0.6,
              child: ClipPath(
                clipper: CubicClipper(),
                child: Container(
                  height: size.height * 1,
                  color: Colors.white,
                ),
              ),
            ),
            SingleChildScrollView(
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
                        const FittedBox(
                          child: const Text(
                            'Forgot Password?',
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
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
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 16,
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
                                prefixIcon: const Icon(Icons.email),
                                labelText: 'Email',
                              ),
                              validator: validator.validateEmail,
                              onSaved: (val) => _email = val,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        _isNetworkCall
                            ? Container(
                                height: size.height * 0.05,
                                alignment: Alignment.center,
                                child: CircularProgressIndicator(),
                              )
                            : CustomButton(
                                height: size.height * 0.07,
                                child: const Text(
                                  'Reset Password',
                                  style: const TextStyle(
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
          ],
        ),
      ),
    );
  }
}

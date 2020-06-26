import 'package:flutter/material.dart';

import '../../widgets/logo_widget.dart';
import '../../utils/forms/form_validator.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/cubic_clipper.dart';

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
          child: Stack(
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
                    // height: size.height,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.all(kToolbarHeight),
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
                              decoration: const InputDecoration(
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
                                child: const CircularProgressIndicator(),
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
                                  FocusScope.of(context).unfocus();

                                  if (_formKey.currentState.validate()) {
                                    setState(() {
                                      _isNetworkCall = true;
                                    });
                                    _formKey.currentState.save();

                                    // Delay to mock as network call
                                    await Future.delayed(
                                      Duration(milliseconds: 1000),
                                    );

                                    // Dialog box to display mock network response
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: const Text('Notification'),
                                            content: Text(
                                              'A mail has been sent to $_email if it is registered with us',
                                            ),
                                          );
                                        });

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
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

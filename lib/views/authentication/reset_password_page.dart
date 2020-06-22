import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  GlobalKey<FormState> _formGlobalKey;

  // Regular Expression for Phone Number
  RegExp _regExpForNumber;

  // Regular Expression for Email
  RegExp _regExpForMail;

  @override
  void initState() {
    _formGlobalKey = GlobalKey<FormState>();
    _regExpForNumber = RegExp(r"[6-9]\d{9}");
    _regExpForMail = RegExp(
        r'(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))');
    super.initState();
  }

  String _validateInput(String input) {
    if ((!_regExpForNumber.hasMatch(input) || input.length != 10) &&
        !_regExpForMail.hasMatch(input)) {
      return "Please provide valid email or number";
    }
    return null;
  }

  void _saveForm() {
    var isValid = _formGlobalKey.currentState.validate();
    if (!isValid) return;

    _formGlobalKey.currentState.save();

    // Operation to be performed if the inputs are valid
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
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
                width: mediaQuery.size.width <= 400
                    ? mediaQuery.size.width * 0.7
                    : mediaQuery.size.width * 0.6,
                child: Form(
                  key: _formGlobalKey,
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Enter email or phone',
                    ),
                    validator: (input) => _validateInput(input),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              FlatButton(
                onPressed: _saveForm,
                child: const Text(
                  'Reset Password',
                  style: const TextStyle(fontSize: 16),
                ),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.0),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 30),
                child: Text(
                  'Show some text saying "mail has been sent / OTP sent"',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

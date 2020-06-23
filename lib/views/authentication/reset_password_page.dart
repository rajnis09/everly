import 'package:flutter/material.dart';

import '../../widgets/logo_widget.dart';
import '../../utils/forms/form_validator.dart';
import '../../widgets/custom_button.dart';

class ResetPasswordPage extends StatefulWidget {
  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  String _email, _phoneNumber;
  bool _autoValidate = false, _isNetworkCall = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // TODO: for@sanjeev Change the UIlook
    // Check for all todo in the file
    // You can change button styling
    // or anything to look the same like the other pages
    // After then all depends on you that what best you can do with th UI

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
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
                width: size.width <= 400 ? size.width * 0.7 : size.width * 0.6,
                child: Form(
                  key: _formKey,
                  autovalidate: _autoValidate,
                  child: TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.phone),
                      labelText: 'Phone Number',
                    ),
                    validator: validator.validateNumber,
                    onSaved: (val) => _phoneNumber = val,
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
                      height: size.height * 0.05,
                      child: const Text(
                        'Reset Password',
                        style:
                            const TextStyle(fontSize: 16, color: Colors.white),
                      ),
                      onPressed: () async {
                        FocusScope.of(context).unfocus();

                        if (_formKey.currentState.validate()) {
                          setState(() {
                            _isNetworkCall = true;
                          });
                          _formKey.currentState.save();

                          // Delay to mock as network call
                          await Future.delayed(Duration(milliseconds: 1000));

                          // Dialog box to display mock network response
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: Text('Notification'),
                                  content: Text(
                                      'An OTP is sent to $_phoneNumber if it is registered with us'),
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

              // TODO: implement reset password with phone number
              // You can either replace the FormField or
              // use a dialog box
            ],
          ),
        ),
      ),
    );
  }
}

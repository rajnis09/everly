import 'package:flutter/material.dart';

import '../../widgets/custom_circular_button.dart';
import 'form_validator.dart';

class SignUpWithPhoneForm extends StatefulWidget {
  @override
  _SignUpWithPhoneFormState createState() => _SignUpWithPhoneFormState();
}

class _SignUpWithPhoneFormState extends State<SignUpWithPhoneForm> {
  String _number, _otp , _firstName, _lastName; // _password
  bool _autoValidate = false, _isNetworkCall = false; //_obscureText = true
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
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      prefixIcon: const Icon(Icons.person),
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
                      labelText: 'Last Name',
                      prefixIcon: const Icon(Icons.person),
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
                      labelText: 'Phone Number',
                      prefixIcon: const Icon(Icons.phone),
                    ),
                    validator: validator.validateNumber,
                    onSaved: (val) => _number = val,
                    keyboardType: TextInputType.phone,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'OTP',
                      prefixIcon: const Icon(Icons.lock_open),
                    ),
                    
                    keyboardType: TextInputType.number,
                    // Here we add otp validator 
                    // validator: validator.validateNumber,
                    onSaved: (val) => _otp = val,
                  ),
                ),

                // Commenting pasword place we will use it if needed
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //       labelText: 'Password',
                //       prefixIcon: const Icon(Icons.lock),
                //       suffixIcon: IconButton(
                //           icon: Icon(iconData),
                //           onPressed: () {
                //             setState(() {
                //               _obscureText = !_obscureText;
                //               iconData = _obscureText
                //                   ? Icons.visibility_off
                //                   : Icons.visibility;
                //             });
                //           }),
                //     ),
                //     obscureText: _obscureText,
                //     keyboardType: TextInputType.text,
                //     validator: validator.validatePassword,
                //     onSaved: (val) => _password = val,
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                //   child: TextFormField(
                //     decoration: InputDecoration(
                //       labelText: 'Confirm Password',
                //       prefixIcon: const Icon(Icons.lock),
                //     ),
                //     obscureText: true,
                //     keyboardType: TextInputType.text,
                //     validator: validator.validateConfirmPassword,
                //   ),
                // ),
                SizedBox(height: size.height * 0.03),
                _isNetworkCall
                    ? Container(
                        height: size.height * 0.1,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(),
                      )
                    : CustomCicularButton(
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
                              _isNetworkCall = true;
                            });
                            _formKey.currentState.save();

                            // Delay to mock as network call
                            await Future.delayed(Duration(milliseconds: 100));

                            // Dialog box to display Form data we recieved
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(
                                        'Name: $_firstName $_lastName\nPhone Number : $_number\nOTP: $_otp'),
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
                SizedBox(height: size.height * 0.02),
              ],
            )),
      ),
    );
  }
}

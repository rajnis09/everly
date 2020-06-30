import 'package:flutter/material.dart';

import '../../widgets/custom_circular_button.dart';

import 'form_validator.dart';

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
                      labelText: 'Email',
                      prefixIcon: const Icon(Icons.email),
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
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                          icon: Icon(iconData),
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
                      labelText: 'Confirm Password',
                      prefixIcon: const Icon(Icons.lock),
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
                                        'Name: $_firstName $_lastName\nEmail : $_email\nPassword: $_password'),
                                  );
                                });
                            setState(() {
                              _isNetworkCall = false;
                            });

                            Navigator.pushNamed(context, '/introPage');
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

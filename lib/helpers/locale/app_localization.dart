import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../l10n/messages_all.dart';

class AppLocalization {
  static Future<AppLocalization> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      return AppLocalization();
    });
  }

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
    );
  }

  String get email {
    return Intl.message(
      'Email',
      name: 'email',
    );
  }

  String get forgotPassword {
    return Intl.message(
      "Forgot Password?",
      name: 'forgotPassword',
    );
  }

  String get registeredEmail {
    return Intl.message(
      "Please enter your registered email to reset your password",
      name: 'registeredEmail',
    );
  }

  String get resetPassword {
    return Intl.message(
      "Reset Password",
      name: 'resetPassword',
    );
  }

  String get sentResetMailText {
    return Intl.message(
      'A link to reset your password has been sent to your email address',
      name: 'sentResetMailText',
    );
  }

  String get invalidEmail {
    return Intl.message(
      'Invalid Email',
      name: 'invalidEmail',
    );
  }

  String get userNotFound {
    return Intl.message(
      'User not found',
      name: 'userNotFound',
    );
  }

  String get defaultFeedbackText {
    return Intl.message(
      "Contact Everly team by filling feedback form",
      name: 'defaultFeedbackText',
    );
  }

  String get error {
    return Intl.message(
      'Error',
      name: 'error',
    );
  }

  String get home {
    return Intl.message('Home', name: 'home');
  }

  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
    );
  }

  String get myOrders {
    return Intl.message(
      'My Orders',
      name: 'myOrders',
    );
  }

  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
    );
  }

  String get scanText {
    return Intl.message(
      'Scan',
      name: 'scanText',
    );
  }

  String get viaPhone {
    return Intl.message(
      'Via Phone',
      name: 'viaPhone',
    );
  }

  String get changePassword {
    return Intl.message(
      'Change Password',
      name: 'changePassword',
    );
  }

  String get addressMan {
    return Intl.message(
      'Address Management',
      name: 'addressMan',
    );
  }

  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
    );
  }

  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
    );
  }

  String get changeLanguage {
    return Intl.message(
      'Change Language',
      name: 'changeLanguage',
    );
  }

  String get help {
    return Intl.message(
      'Help & Support',
      name: 'help',
    );
  }

  String get rate {
    return Intl.message(
      'Rate App',
      name: 'rate',
    );
  }

  String get invite {
    return Intl.message(
      'Invite Friends',
      name: 'invite',
    );
  }

  String get tnc {
    return Intl.message(
      'Terms and Conditions',
      name: 'tnc',
    );
  }

  String get privacy {
    return Intl.message(
      'Privacy and Policy',
      name: 'privacy',
    );
  }

  String get errorText {
    return Intl.message(
      'Oops!! Some error occured',
      name: 'errorText',
    );
  }

  String get login {
    return Intl.message(
      'LogIn',
      name: 'login',
    );
  }

  String get signUpEmail {
    return Intl.message(
      'Sign up with email',
      name: 'signUpEmail',
    );
  }

  String get signUpPhone {
    return Intl.message(
      'Sign up with phone',
      name: 'signUpPhone',
    );
  }

  String get signUp {
    return Intl.message(
      'SignUp',
      name: 'signUp',
    );
  }

  String get verifyToContinue {
    return Intl.message(
      'Verify your Email to Continue',
      name: 'verifyToContinue',
    );
  }

  String get emailPhone {
    return Intl.message(
      'Email or phone',
      name: 'emailPhone',
    );
  }

  String get pass {
    return Intl.message(
      'Password',
      name: 'pass',
    );
  }

  String get firstName {
    return Intl.message(
      'First Name',
      name: 'firstName',
    );
  }

  String get lastName {
    return Intl.message(
      'Last Name',
      name: 'lastName',
    );
  }

  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
    );
  }

  String get phone {
    return Intl.message(
      'Phone Number',
      name: 'phone',
    );
  }

  String get lang {
    return Intl.message(
      'हिन्दी',
      name: 'lang',
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  final Locale overriddenLocale;

  AppLocalizationDelegate(this.overriddenLocale);

  @override
  bool isSupported(Locale locale) {
    return ['en', 'hi'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) {
    return AppLocalization.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalization> old) {
    return false;
  }
}

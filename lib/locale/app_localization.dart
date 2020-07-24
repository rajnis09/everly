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
    return Intl.message(
      'Home',
      name: 'home'
    );
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

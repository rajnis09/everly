// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a hi locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'hi';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static _notInlinedMessages(_) => <String, Function> {
    "defaultFeedbackText" : MessageLookupByLibrary.simpleMessage("फीडबैक फॉर्म भरकर Everly टीम से संपर्क करें"),
    "email" : MessageLookupByLibrary.simpleMessage("ईमेल"),
    "error" : MessageLookupByLibrary.simpleMessage("एरर"),
    "forgotPassword" : MessageLookupByLibrary.simpleMessage("पासवर्ड भूल गए?"),
    "invalidEmail" : MessageLookupByLibrary.simpleMessage("अवैध ईमेल"),
    "ok" : MessageLookupByLibrary.simpleMessage("ठीक"),
    "registeredEmail" : MessageLookupByLibrary.simpleMessage("कृपया अपना पासवर्ड रीसेट करने के लिए अपना पंजीकृत ईमेल दर्ज करें"),
    "resetPassword" : MessageLookupByLibrary.simpleMessage("पासवर्ड रीसेट करें"),
    "sentResetMailText" : MessageLookupByLibrary.simpleMessage("पासवर्ड रीसेट करने का लिंक आपके ईमेल पते पर भेज दिया गया है"),
    "userNotFound" : MessageLookupByLibrary.simpleMessage("उपभोक्ता नहीं मिला")
  };
}

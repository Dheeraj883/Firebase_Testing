import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'file:///C:/Users/Intruder/AndroidStudioProjects/time_tracker_flutter_course/lib/common_widgets/platform_alert_dialog.dart';

class PlatformExceptionAlertDialog extends PlatformAlertDialog {
  PlatformExceptionAlertDialog({
    @required String title,
    @required FirebaseAuthException exception,
  }) : super(
          title: title,
          content: _message(exception),
          defaultActionText: 'OK',
        );
  static String _message(FirebaseAuthException exception) {
    return _errors[exception.code] ?? exception.message;
  }

  static Map<String, String> _errors = {
    /// **invalid-email**:
    ///  - Thrown if the email address is not valid.
    /// - **user-disabled**:
    ///  - Thrown if the user corresponding to the given email has been disabled.
    /// - **user-not-found**:
    ///  - Thrown if there is no user corresponding to the given email.

    '**wrong-password**': "The password is invalid"

    ///    /// - **email-already-in-use**:
    ///   ///  - Thrown if there already exists an account with the given email address.
    //   /// - **invalid-email**:
    //   ///  - Thrown if the email address is not valid.
    //   /// - **operation-not-allowed**:
    //   ///  - Thrown if email/password accounts are not enabled. Enable
    //   ///    email/password accounts in the Firebase Console, under the Auth tab.
    //   /// - **weak-password**:
    //   ///  - Thrown if the password is not strong enough.
  };
}

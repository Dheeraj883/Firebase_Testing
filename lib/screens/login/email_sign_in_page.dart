import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/screens/login/email_sign_in_form.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class EmailSignInPage extends StatelessWidget {
  EmailSignInPage({@required this.auth});
  final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        elevation: 2.0,
      ),
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Card(
            child: EmailSignInForm(
              auth: auth,
            ),
          ),
        ),
      ),
    );
  }
}

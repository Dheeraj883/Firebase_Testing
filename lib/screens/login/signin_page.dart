import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/screens/login/email_sign_in_page.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
import 'package:time_tracker_flutter_course/services/platform_exception_alert_dialog.dart';
import 'package:time_tracker_flutter_course/widgets/reusable_button.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;
  void _showSignInError(BuildContext context, FirebaseAuthException exception) {
    PlatformExceptionAlertDialog(
      title: 'Sign in failed ',
      exception: exception,
    ).show(context);
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      setState(() => _isLoading = true);
      final auth = Provider.of<AuthBase>(context, listen: false);

      await auth.signInAnonymously();
    } catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      setState(() => _isLoading = true);
      final auth = Provider.of<AuthBase>(context, listen: false);

      await auth.signInWithGoogle();
    } catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _signInWithFacebook(BuildContext context) async {
    try {
      setState(() => _isLoading = true);
      final auth = Provider.of<AuthBase>(context, listen: false);

      await auth.signInWithFacebook();
    } catch (e) {
      if (e.code != 'ERROR_ABORTED_BY_USER') {
        _showSignInError(context, e);
      }
    } finally {
      setState(() => _isLoading = false);
    }
  }

  void _signInWithEmail(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => EmailSignInPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Time Tracker'),
        elevation: 2.0,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: _buildHeader(),
              height: 50.0,
            ),
            SizedBox(
              height: 50.0,
            ),
            ReusableButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('images/google-logo.png'),
                  Text(
                    'Sign in with Google',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.black87,
                    ),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Image.asset('images/google-logo.png'),
                  ),
                ],
              ),
              callback: _isLoading ? null : () => _signInWithGoogle(context),
              color: Colors.white,
            ),
            SizedBox(
              height: 10.0,
            ),
            ReusableButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('images/facebook-logo.png'),
                  Text(
                    'Sign in with Facebook',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                  ),
                  Opacity(
                    opacity: 0.0,
                    child: Image.asset('images/facebook-logo.png'),
                  ),
                ],
              ),
              callback: _isLoading ? null : () => _signInWithFacebook(context),
              color: Color(0xFF334D92),
            ),
            SizedBox(
              height: 10.0,
            ),
            ReusableButton(
              child: Text(
                'Sign in with Email',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.white,
                ),
              ),
              callback: _isLoading ? null : () => _signInWithEmail(context),
              color: Colors.teal[700],
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'or',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.black87,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ReusableButton(
              child: Text(
                'Go Anonymous',
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
              callback: _isLoading ? null : () => _signInAnonymously(context),
              color: Colors.lime[300],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }

  Widget _buildHeader() {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
      'Sign in',
      style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

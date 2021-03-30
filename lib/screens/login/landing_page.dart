import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/screens/login/home_page.dart';
import 'package:time_tracker_flutter_course/screens/login/signin_page.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class LandingPage extends StatelessWidget {
  final AuthBase auth;
  LandingPage({@required this.auth});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<NormalUser>(
      stream: auth.onAuthStateChanged,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          NormalUser user = snapshot.data;
          if (user == null) {
            return SignInPage(
              auth: auth,
            );
          }
          return HomePage(
            auth: auth,
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}

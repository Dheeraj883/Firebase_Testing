import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class SignInManager {
  SignInManager({@required this.auth, @required this.isLoading});
  final AuthBase auth;
  final ValueNotifier<bool> isLoading;

  Future<NormalUser> _signIn(Future<NormalUser> Function() signInMethod) async {
    try {
      isLoading.value = true;
      return await signInMethod();
    } catch (e) {
      isLoading.value = false;
      rethrow;
    }
  }

  Future<NormalUser> signInAnonymously() async =>
      await _signIn(auth.signInAnonymously);

  Future<NormalUser> signInWithGoogle() async =>
      await _signIn(auth.signInWithGoogle);
  Future<NormalUser> signInWithFacebook() async =>
      await _signIn(auth.signInWithFacebook);
}

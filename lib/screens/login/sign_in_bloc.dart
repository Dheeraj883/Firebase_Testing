import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class SignInBloc {
  SignInBloc({@required this.auth});
  final AuthBase auth;
  final StreamController<bool> _isLoadingController = StreamController<bool>();

  Stream<bool> get isLoadingStream => _isLoadingController.stream;
  void dispose() {
    _isLoadingController.close();
  }

  void _setIsLoading(bool isLaoding) => _isLoadingController.add(isLaoding);

  Future<NormalUser> _signIn(Future<NormalUser> Function() signInMethod) async {
    try {
      _setIsLoading(true);
      return await signInMethod();
    } catch (e) {
      _setIsLoading(false);
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

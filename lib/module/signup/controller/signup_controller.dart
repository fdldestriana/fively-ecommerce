// import package
import 'package:fively_ecommerce/core.dart';

import 'package:flutter/material.dart';

class SignupController with ChangeNotifier {
  AuthState _state = AuthState.notRegistered;
  AuthState get state => _state;

  User _user = User.user;

  String _message = '';
  String get message => _message;

  void _setState(AuthState state) {
    _state = state;
    notifyListeners();
  }

  // Future<void> doEmailSignUp(
  //     {required String name,
  //     required String email,
  //     required String password,
  //     required String photoProfile}) async {
  //   var user = await FirebaseAuthService.doEmailSignUp(
  //           name: name,
  //           email: email,
  //           password: password,
  //           photoProfile: photoProfile)
  //       .then((value) => value!.user);

  //   _user.username = user!.displayName as String;
  //   _user.email = user!.email as String;
  //   _user.email = user!.email as String;
  // }
}

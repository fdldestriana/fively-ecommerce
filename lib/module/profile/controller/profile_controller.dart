import 'package:firebase_auth/firebase_auth.dart';
import 'package:fively_ecommerce/service/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:fively_ecommerce/model/user.dart';

class ProfileController extends ChangeNotifier {
  UserCredential? _userCredential;
  UserCredential? get userCredential => _userCredential;
  getCurretUser() async {
    _userCredential = await FirebaseAuthService.doGoogleLogin();
  }
}

// import package
import 'package:fively_ecommerce/model/failure.dart';
import 'package:fively_ecommerce/model/user.dart';
import 'package:fively_ecommerce/service/web_service.dart';
import 'package:fively_ecommerce/shared/utils/state.dart';
import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class SignupController with ChangeNotifier {
  AuthState _state = AuthState.notRegistered;
  AuthState get state => _state;

  void _setState(AuthState state) {
    _state = state;
    notifyListeners();
  }

  Failure _failure = Failure('message');

  Failure get failure => _failure;
  void _setFailure(Failure failure) {
    _failure = failure;
    notifyListeners();
  }

  // The user data
  User _user = User(
      id: 0,
      username: 'username',
      email: 'email',
      firstName: 'firstName',
      lastName: 'lastName',
      gender: 'gender',
      image: 'image',
      token: 'token');
  User get user => _user;
  Future<void> signUp(String username, String email, String password) async {
    try {
      _setState(AuthState.registering);
      _user = await WebService.signUp(username, email, password);
      // _setPrefsUserId(_user.token, _user.id);
      notifyListeners();
    } on Failure catch (f) {
      _setFailure(f);
    }
    _setState(AuthState.registered);
  }

  // void _setPrefsUserId(String token, int userId) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('token', token);
  //   prefs.setInt('userId', userId);
  // }

  // void getPrefsUserId() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.getString('token') ?? 'token';
  //   prefs.getInt('userId') ?? 0;
  //   notifyListeners();
  // }
}
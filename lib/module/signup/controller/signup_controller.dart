// import package
import 'package:fively_ecommerce/model/failure.dart';
import 'package:fively_ecommerce/model/user.dart';
import 'package:fively_ecommerce/service/user_preferrences.dart';
import 'package:fively_ecommerce/service/web_service.dart';
import 'package:fively_ecommerce/shared/utils/state.dart';
import 'package:flutter/material.dart';

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

  User _user = User();
  User get user => _user;
  Future<void> signUp(String username, String email, String password) async {
    try {
      _setState(AuthState.registering);
      _user = await WebService.signUp(username, email, password);
      UserPreferrences().saveUser(_user);
      notifyListeners();
    } on Failure catch (f) {
      _setFailure(f);
    }
    _setState(AuthState.registered);
  }
}

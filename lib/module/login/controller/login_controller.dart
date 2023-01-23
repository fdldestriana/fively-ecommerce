// import package
import 'package:fively_ecommerce/model/failure.dart';
import 'package:fively_ecommerce/model/user.dart';
import 'package:fively_ecommerce/service/web_service.dart';
import 'package:fively_ecommerce/shared/utils/notifier_state.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController with ChangeNotifier {
  NotifierState _state = NotifierState.loading;
  NotifierState get state => _state;

  void _setState(NotifierState state) {
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
  late User _user;
  User get user => _user;
  Future<void> login() async {
    try {
      _user = await WebService.login();
      _setPrefsUserId(_user.id);
      notifyListeners();
    } on Failure catch (f) {
      _setFailure(f);
    }
    _setState(NotifierState.loaded);
  }

  void _setPrefsUserId(int userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', userId);
  }

  void getPrefsUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.getInt('userId') ?? 0;
    notifyListeners();
  }
}

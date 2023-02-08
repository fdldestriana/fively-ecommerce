// import package
import 'package:fively_ecommerce/model/user.dart';
import 'package:fively_ecommerce/service/web_service.dart';
import 'package:fively_ecommerce/shared/utils/state.dart';
import 'package:flutter/material.dart';

class SignupController with ChangeNotifier {
  AuthState _state = AuthState.notRegistered;
  AuthState get state => _state;

  User _user = User(
      id: 0,
      username: '',
      email: '',
      firstName: '',
      lastName: '',
      gender: '',
      image: '',
      token: '');
  User get user => _user;

  String _message = '';
  String get message => _message;

  void _setState(AuthState state) {
    _state = state;
    notifyListeners();
  }

  Future<Map<String, dynamic>> signUp(
      String username, String email, String password) async {
    Map<String, dynamic> result;
    _setState(AuthState.registering);
    var data = await WebService.signUp(username, email, password);
    if (data['status']) {
      _user = data['data'];
      _message = data['message'];
      _setState(AuthState.registered);
      result = {'status': data['status'], 'state': state};
      notifyListeners();
    } else {
      _message = data['message'];
      _setState(AuthState.notRegistered);
      result = {'status': data['status'], 'state': state};
      notifyListeners();
    }
    return result;
  }
}

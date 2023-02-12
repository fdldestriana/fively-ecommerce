import 'package:fively_ecommerce/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferrences {
  Future saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('userId', user.id);
    prefs.setString('username', user.username);
    prefs.setString('email', user.email);
    prefs.setString('firstName', user.firstName);
    prefs.setString('lastName', user.lastName);
    prefs.setString('gender', user.gender);
    prefs.setString('image', user.image);
    prefs.setString('token', user.token);
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      int id = prefs.getInt('userId') as int;
      String username = prefs.getString('username') as String;
      String email = prefs.getString('email') as String;
      String firstName = prefs.getString('firstName') as String;
      String lastName = prefs.getString('lastName') as String;
      String gender = prefs.getString('gender') as String;
      String image = prefs.getString('image') as String;
      String token = prefs.getString('token') as String;

      return User(
          id: id,
          username: username,
          email: email,
          firstName: firstName,
          lastName: lastName,
          gender: gender,
          image: image,
          token: token);
    } catch (e) {
      throw e.toString();
    }
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('id');
    prefs.remove('username');
    prefs.remove('email');
    prefs.remove('firstName');
    prefs.remove('lastName');
    prefs.remove('gender');
    prefs.remove('image');
    prefs.remove('token');
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') as String;
    return token;
  }
}

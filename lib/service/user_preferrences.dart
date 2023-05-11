import 'package:fively_ecommerce/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreferrences {
  Future saveUser(User user) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', user.username);
    prefs.setString('email', user.email);
    prefs.setString('firstName', user.firstName);
    prefs.setString('lastName', user.lastName);
    prefs.setString('image', user.image);
    prefs.setString('uid', user.uid);
  }

  Future<User> getUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    try {
      String uid = prefs.getString('uid') as String;
      String username = prefs.getString('username') as String;
      String email = prefs.getString('email') as String;
      String firstName = prefs.getString('firstName') as String;
      String lastName = prefs.getString('lastName') as String;
      String image = prefs.getString('image') as String;

      return User(
          username: username,
          email: email,
          firstName: firstName,
          lastName: lastName,
          image: image,
          uid: uid);
    } catch (e) {
      throw e.toString();
    }
  }

  void removeUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('uid');
    prefs.remove('username');
    prefs.remove('email');
    prefs.remove('firstName');
    prefs.remove('lastName');
    prefs.remove('image');
  }
}

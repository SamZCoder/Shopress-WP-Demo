import 'package:shopress/wordpress/models/user.dart';

class Session {
  static String _token = "";
  static User? _currentUser = null;

  static void setToken(String token) {
    _token = token;
  }

  static String getToken() {
    return _token;
  }

  static void setCurrentUser(User user) {
    _currentUser = user;
  }

  static User? getCurrentUser() {
    return _currentUser;
  }

  static bool authenticated() => _token != null && _currentUser != null;
}

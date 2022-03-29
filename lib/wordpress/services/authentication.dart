import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shopress/wordpress/config/session.dart';
import 'package:shopress/wordpress/config/endpoints.dart';
import 'package:shopress/wordpress/models/user.dart';
import 'package:shopress/wordpress/wordpress.dart';

class AuthenticationService {
  //Authenticate using JWT
  //EndPoint: jwt-auth/v1/token/validate
  static Future<bool> attempt(String username, String password) async {
    var uri = Uri.parse(EndPoints.AUTH_TOKEN);
    try {
      var response = await http.post(uri, body: {
        "username": username,
        "password": password,
      });
      if (response.statusCode == 200) {
        dynamic json = jsonDecode(response.body);
        String token = json["data"]["token"] as String;
        //Set Session if Token Retrieved
        Session.setToken(token);

        User user = User(
          displayName: json["data"]["displayName"] as String,
          firstName: json["data"]["firstName"] as String,
          lastName: json["data"]["lastName"] as String,
          email: json["data"]["email"] as String,
          niceName: json["data"]["nicename"] as String,
          id: json["data"]["id"] as int,
        );
        Session.setCurrentUser(user);
        return true;
      }
    } catch (err) {}

    return false;
  }

  //Registration as a Customer
  //EndPoint: wc/v3/customers
  static Future<User?> register(User user) async {
    var uri = Uri.parse(EndPoints.WC_CUSTOMERS);
    try {
      var response = await http.post(uri, body: {
        "username": user.displayName,
        "email": user.email,
        "password": user.password,
        "first_name": user.firstName,
        "last_name": user.lastName,
      }, headers: {
        ...WordPress.getWooCommerceHeaders()
      });

      if (response.statusCode == 201) {
        dynamic json = jsonDecode(response.body);
        return User.fromCustomerJson(json);
      }

      print(response.body);

      return null;
    } catch (err) {}
    return null;
  }

  static Future<User?> me() async {
    //TODO: to be implemented
    return null;
  }
}

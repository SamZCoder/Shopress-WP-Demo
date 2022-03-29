import 'dart:convert';

import 'package:shopress/wordpress/config/keys.dart';
import 'package:shopress/wordpress/services/authentication.dart';
import 'package:shopress/wordpress/services/products.dart';

class WordPress {
  static final AuthenticationService _authenticationService =
      AuthenticationService();
  static final ProductsService _productsService = ProductsService();

  //Accessors
  static AuthenticationService authentication() => _authenticationService;
  static ProductsService products() => _productsService;

  static Map<String, String> getWooCommerceHeaders() {
    return {
      "Authorization": "Basic " +
          base64Encode(utf8.encode(
              '${WordPressKeys.WC_CONSUMER_KEY}:${WordPressKeys.WC_CONSUMER_SECRET}')),
    };
  }
}

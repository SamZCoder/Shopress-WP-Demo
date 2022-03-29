import 'dart:convert';

import 'package:shopress/wordpress/config/endpoints.dart';
import 'package:shopress/wordpress/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:shopress/wordpress/models/product_category.dart';
import 'package:shopress/wordpress/wordpress.dart';

class ProductsService {
  Future<List<Product>?> all([Map<String, dynamic>? params]) async {
    var uri = Uri.parse(EndPoints.WC_PRODUCTS);
    //Add Filters Support
    if (params != null && params.isNotEmpty) {
      uri = uri.replace(queryParameters: params);
    }
    try {
      var response =
          await http.get(uri, headers: {...WordPress.getWooCommerceHeaders()});
      if (response.statusCode == 200) {
        List products = jsonDecode(response.body) as List;
        return products
            .map((productElement) => Product.fromJson(productElement))
            .toList();
      }
    } catch (err) {
      print(err);
    }
    return null;
  }

  Future<List<Product>?> newest([int limit = 5]) async {
    return await all({"order": "desc", "per_page": limit.toString()});
  }

  Future<List<Product>?> popular([int limit = 5]) async {
    return await all({"order_by": "popularity", "per_page": limit.toString()});
  }

  Future<List<ProductCategory>?> categories() async {
    var uri = Uri.parse(EndPoints.WC_PRODUCTS_CATEGORIES);
    try {
      var response =
          await http.get(uri, headers: {...WordPress.getWooCommerceHeaders()});
      if (response.statusCode == 200) {
        List categoriesJson = jsonDecode(response.body) as List;
        return categoriesJson
            .map((categoryEntry) => ProductCategory.fromJson(categoryEntry))
            .toList();
      }
    } catch (err) {
      print(err);
    }
    return null;
  }
}

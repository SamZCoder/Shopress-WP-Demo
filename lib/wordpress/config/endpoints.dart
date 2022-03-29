class EndPoints {
  static const BASE = "https://wordpress.procoders.site/";
  static const API = BASE + "wp-json/";

  //Authentication Endpoints
  static const AUTH_TOKEN = API + "jwt-auth/v1/token";
  static const AUTH_VALIDATE_TOKEN = API + "jwt-auth/v1/token/validate";

  //WooCommerce
  static const WC2 = API + "wc/v2";
  static const WC3 = API + "wc/v3";

  //WooCommerce Customers
  static const WC_CUSTOMERS = "$WC3/customers";

  //WooCommerce Products
  static const WC_PRODUCTS = "$WC3/products";
  static const WC_PRODUCTS_CATEGORIES = "$WC_PRODUCTS/categories";
}

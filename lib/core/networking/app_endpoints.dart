class ApiEndpoints {
  static const String baseUrl = "https://dummyjson.com/";
  static const String getAllProductsEndpoint = "${baseUrl}products";
  static const String getSpecificProductsEndpoint = "${baseUrl}products[index]";
  static const String getCartEndpoint = "${baseUrl}carts";
  static const String getCategoriesEndpoint = "${baseUrl}products/categories";
  static const String getLoginEndpoint = "${baseUrl}auth/login";
}

//static const String loginEndpoint = "api/v1/auth/signin";
  // static const String registerEndpoint = "api/v1/auth/signup";
  // static const String getAllProductsEndpoint = "products";
  // static const String getCategoryEndpoint = "api/v1/categories";
  // static const String getSpecificCategoryEndpoint =
  //     "api/v1/categories/6407ebf65bbc6e43516931ec";
  // static const String getCartEndpoint = "api/v1/cart";
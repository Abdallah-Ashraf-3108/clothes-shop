class ApiEndpoints {
  static const String baseUrl = "https://ecommerce.routemisr.com";

  // ==================== Auth endpoints (9) ====================
  static const String loginEndpoint = "/api/v1/auth/signin";
  static const String registerEndpoint = "/api/v1/auth/signup";
  static const String forgotPasswordEndpoint = "/api/v1/auth/forgotPassword";
  static const String verifyResetCodeEndpoint = "/api/v1/auth/verifyResetCode";
  static const String resetPasswordEndpoint = "/api/v1/auth/resetPassword";
  static const String getCurrentUserEndpoint = "/api/v1/auth/me";
  static const String changePasswordEndpoint = "/api/v1/auth/changePassword";
  static const String updateProfileEndpoint = "/api/v1/auth/updateMe";
  static const String deleteAccountEndpoint = "/api/v1/auth/deleteMe";

  // ==================== Products endpoints (2) ====================
  static const String getAllProductsEndpoint = "${baseUrl}/api/v1/products";
  static const String getSpecificProductsEndpoint = "${baseUrl}/api/v1/products/";

  // ==================== Categories endpoints (5) ====================
  static const String getCategoriesEndpoint = "${baseUrl}/api/v1/categories";
  static const String getCategoryByIdEndpoint = "${baseUrl}/api/v1/categories/";
  static const String getSubcategoriesEndpoint = "/subcategories";
  static const String getCategoryProductsEndpoint = "/products";
  static const String getCategoryBySlugEndpoint = "${baseUrl}/api/v1/categories/";

  // ==================== Brands endpoints (2) ====================
  static const String getBrandsEndpoint = "${baseUrl}/api/v1/brands";
  static const String getBrandByIdEndpoint = "${baseUrl}/api/v1/brands/";

  // ==================== Cart endpoints (6) ====================
  static const String getCartEndpoint = "${baseUrl}/api/v1/cart";
  static const String addToCartEndpoint = "${baseUrl}/api/v1/cart";
  static const String updateCartItemEndpoint = "${baseUrl}/api/v1/cart/";
  static const String removeCartItemEndpoint = "${baseUrl}/api/v1/cart/";
  static const String clearCartEndpoint = "${baseUrl}/api/v1/cart";
  static const String applyCouponEndpoint = "${baseUrl}/api/v1/cart/applyCoupon";

  // ==================== Orders endpoints (4) ====================
  static const String checkoutSessionEndpoint = "${baseUrl}/api/v1/orders/checkout-session/";
  static const String getUserOrdersEndpoint = "${baseUrl}/api/v1/orders/user/";
  static const String getOrderByIdEndpoint = "${baseUrl}/api/v1/orders/";
  static const String cashCheckoutEndpoint = "${baseUrl}/api/v1/orders/cash/";

  // ==================== Wishlist endpoints (3) ====================
  static const String getWishlistEndpoint = "${baseUrl}/api/v1/wishlist";
  static const String addToWishlistEndpoint = "${baseUrl}/api/v1/wishlist";
  static const String removeFromWishlistEndpoint = "${baseUrl}/api/v1/wishlist/";

  // ==================== Addresses endpoints (4) ====================
  static const String getAddressesEndpoint = "${baseUrl}/api/v1/addresses";
  static const String addAddressEndpoint = "${baseUrl}/api/v1/addresses";
  static const String updateAddressEndpoint = "${baseUrl}/api/v1/addresses/";
  static const String deleteAddressEndpoint = "${baseUrl}/api/v1/addresses/";
}

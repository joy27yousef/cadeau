class AppEndpoint {
  static const String server = 'https://cdb-back.bw-businessworld.net/api/';

  //!auth
  static const String login = '/login';
  static const String accountRemoval = '/account-removal';
  static const String logout = '/logout';
  static const String rigister = '/register';
  static const String verifyAccount = '/email-verification';
  static const String sendResetCode = '/send-reset-code';
  static const String resetPassword = '/reset-password';
  //! categories
  static const String categories = '/categories';
  //! brands
  static const String brands = '/brands';
  //!occasions
  static const String occasions = '/occasions';
  static const String specialOccasion = '/special-occasion';
  //! product
  static const String products = '/products';
  static const String latestProducts = '/latest-products';
  static const String filter = '/products/filter';
  //!wishlist
  static const String wishlistAdd = '/wishlist/add';
  static const String wishlistRemove = '/wishlist/remove';
  static const String wishlist = '/wishlist';
  static const String addtoCart = '/cart/add';
  //!
}

class ApiKey {
  static String status = 'status';
  static String message = 'message';
  static String code = 'code';
  static String data = 'data';
  static String user = 'user';
  static String userAbility = 'userAbility';
  static String dateOfVerify = 'dateOfVerify';
  static String otp = 'otp';

  static String userId = 'userId';
  static String userName = 'userName';
  static String userGender = 'userGender';
  static String userPhoneNumber = 'userPhoneNumber';
  static String userEmail = 'userEmail';
  static String name = 'name';
  static String phoneNumber = 'phoneNumber';
  static String email = 'email';
  static String password = 'password';
  static String passwordConfirmation = 'password_confirmation';
  static String accessToken = 'accessToken';
  //! category
  static String categoryId = 'categoryId';
  static String categoryNameEnglish = 'categoryNameEnglish';
  static String categoryNameArabic = 'categoryNameArabic';
  static String categoryDescriptionEnglish = 'categoryDescriptionEnglish';
  static String categoryDescriptionArabic = 'categoryDescriptionArabic';
  static String categoryImage = 'categoryImage';
  static String subcategories = 'subcategories';
  static String products = 'products';
  static String category = 'category';
  static String productFeatures = 'productFeatures';
  static String productId = 'productId';
  static String productNameEnglish = 'productNameEnglish';
  static String productNameArabic = 'productNameArabic';
  static String productDescriptionEnglish = 'productDescriptionEnglish';
  static String productDescriptionArabic = 'productDescriptionArabic';
  static String productPrice = 'productPrice';
  //! brands
  static String brandId = 'brandId';
  static String brandNameEnglish = 'brandNameEnglish';
  static String brandNameArabic = 'brandNameArabic';
  static String brandDescriptionEnglish = 'brandDescriptionEnglish';
  static String brandDescriptionArabic = 'brandDescriptionArabic';
  static String brandLogo = 'brandLogo';
  static String brand = 'brand';
  //! occasion
  static String occasionId = 'occasionId';
  static String image = 'image';
  static String occasion = 'occasion';
  static String occasionNameEnglish = 'occasionNameEnglish';
  static String occasionNameArabic = 'occasionNameArabic';
  static String occasionDescriptionEnglish = 'occasionDescriptionEnglish';
  static String occasionDescriptionArabic = 'occasionDescriptionArabic';
  static String occasionImage = 'occasionImage';
  //! product
  static const String price = 'price';
  static const String productPriceFrom = 'productPriceFrom';
  static const String productRating = 'productRating';
  static const String vendorLogo = 'vendorLogo';
  static const String vendorShopNameArabic = 'vendorShopNameArabic';
  static const String vendorShopNameEnglish = 'vendorShopNameEnglish';

  static const String productFeaturesEnglish = 'productFeaturesEnglish';
  static const String productFeaturesArabic = 'productFeaturesArabic';
  static const String productImage = 'productImage';
  static const String rating = 'rating';
  static const String ratingId = 'ratingId';
  static const String review = 'review';
  static const String ratings = 'ratings';
  static const String stockQuantity = 'stockQuantity';
  static const String inStock = 'inStock';

  //! Features
  static const String featuresEnglish = 'featuresEnglish';
  static const String featuresArabic = 'featuresArabic';

  //! Images & Variants
  static const String images = 'images';
  static const String variants = 'variants';

  //! Variant
  static const String variantId = 'variantId';
  static const String variantSku = 'variantSku';
  static const String variantPrice = 'variantPrice';
  static const String attributes = 'attributes';

  //!wishlist
  static const String wishlist = 'wishlist';
  static const String wishlistItems = 'wishlistItems';
  static const String id = 'id';
  static const String itemsCount = 'itemsCount';
  static const String createdAt = 'createdAt';
  static const String updatedAt = 'updatedAt';
  static const String vendorId = 'vendorId';
  static const String nameen = 'name_en';
  static const String namear = 'name_ar';
  static const String descriptionen = 'description_en';
  static const String descriptionar = 'description_ar';
  static const String featuresen = 'features_en';
  static const String featuresar = 'features_ar';
}

class GeneralKey {
  static String token = 'token';
  static String userId = 'userId';
}

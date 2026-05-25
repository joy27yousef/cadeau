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
  static const String isfollowing = '/is-following';
  static const String follow = '/follow';
  static const String unfollow = '/unfollow';
  //!occasions
  static const String occasions = '/occasions';
  static const String specialOccasion = '/special-occasion';
  //! product
  static const String products = '/products';
  static const String latestProducts = '/latest-products';
  static const String filter = '/products/filter';
  static const String rating = '/rating';
  static const String onlyForYou = '/only-for-you';
  //!wishlist
  static const String wishlistAdd = '/wishlist/add';
  static const String wishlistRemove = '/wishlist/remove';
  static const String wishlist = '/wishlist';

  //! cart
  static const String addtoCart = '/cart/add';
  static const String getCart = '/cart';
  static const String removeCart = '/cart/remove';
  //! checkout
  static const String checkout = '/checkout';
  static const String orders = '/orders';
  //! report
  static const String contactUs = '/contact-us';
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
  static String user_Id = 'user_id';
  static String userName = 'userName';
  static String userGender = 'userGender';
  static String userPhoneNumber = 'userPhoneNumber';
  static String userEmail = 'userEmail';
  static String name = 'name';
  static String nameEn = 'nameEn';
  static String nameAr = 'nameAr';
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
  static String brandCoverImg = 'brandCoverImg';
  static String followersCount = 'followersCount';
  static String isFollowing = 'isFollowing';
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
  static const String attributesEn = 'attributesEn';
  static const String attributesAr = 'attributesAr';

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
  static const String name_en = 'name_en';
  static const String name_ar = 'name_ar';
  static const String descriptionen = 'description_en';
  static const String descriptionar = 'description_ar';
  static const String featuresen = 'features_en';
  static const String featuresar = 'features_ar';
  //! Search
  static const String maxPrice = 'maxPrice';
  static const String minPrice = 'minPrice';
  static const String color = 'color';
  static const String storage = 'storage';
  static const String size = 'size';

  //! cart
  static const String cart = 'cart';
  static const String cartItemId = 'cartItemId';
  static const String cartItems = 'cartItems';
  static const String items_count = 'items_count';
  static const String created_at = 'created_at';
  static const String updated_at = 'updated_at';
  static const String quantity = 'quantity';
  static const String variantAttributes = 'variantAttributes';
  static const String totalPrice = 'totalPrice';
  //! tarck order
  static const String orderId = 'orderId';
  static const String orderNumber = 'orderNumber';
  static const String shippingName = 'shippingName';
  static const String shippingPhone = 'shippingPhone';
  static const String shippingAddress = 'shippingAddress';
  static const String orderItems = 'orderItems';
  static const String total = 'total';
  static const String orderStatus = 'orderStatus';
  static const String paymentStatus = 'paymentStatus';
  static const String date = 'date';
  static const String product_d = 'product_id';
  //! reports
  static const String subject = 'subject';
  //! friends
  static const String reqStatus = 'reqStatus';
  static const String senderId = 'senderId';
  static const String senderName = 'senderName';
  static const String senderEmail = 'senderEmail';
  static const String senderProfilImg = 'senderProfilImg';
  static const String receiverId = 'receiverId';
  static const String receiverName = 'receiverName';
  static const String receiverEmail = 'receiverEmail';
  static const String receiverProfilImg = 'receiverProfilImg';
  static const String userImg = 'userImg';
  static const String userBirthDate = 'userBirthDate';
  static const String currentPage = 'currentPage';
  static const String lastPage = 'lastPage';
  static const String perPage = 'perPage';
  static const String pagination = 'pagination';
  static const String userprofileImg = 'userprofileImg';
  static const String isFriend = 'isFriend';
}

class GeneralKey {
  static String token = 'token';
  static String userId = 'userId';
}

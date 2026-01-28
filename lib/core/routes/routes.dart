import 'package:cadeau/core/middleware/app_middleware.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/features/auth/forgotPassword/screens/forgotPassword/forgotPassword_page.dart'
    show ForgotpasswordPage;

import 'package:cadeau/features/auth/login/screen/login_page.dart';
import 'package:cadeau/features/auth/forgotPassword/screens/resetPassword/resetpassword_page.dart';
import 'package:cadeau/features/auth/signUp/screen/signup_page.dart';
import 'package:cadeau/features/auth/verificationAccount/screens/verification_account_page.dart';
import 'package:cadeau/features/brands/screen/all_brands.dart';
import 'package:cadeau/features/brands/screen/main_brand_page.dart';
import 'package:cadeau/features/cart/screens/checkout/checkout_page.dart';
import 'package:cadeau/features/cart/screens/complete%20payment/complete_ayment_page.dart';
import 'package:cadeau/features/cart/screens/success_pay.dart';
import 'package:cadeau/features/categories/screens/main_category_page.dart';

import 'package:cadeau/features/categories/screens/all_categories/all_categories_page.dart';
import 'package:cadeau/features/occasions/screens/all_ocassion/all_ocassion_page.dart';
import 'package:cadeau/features/product/screens/product_page.dart';
import 'package:cadeau/features/profile/settings/delete_account/screens/delete_account_page.dart';
import 'package:cadeau/features/search/screens/saerch_page.dart';
import 'package:cadeau/features/main_page.dart';
import 'package:cadeau/features/occasions/screens/main_occasion_page.dart';
import 'package:cadeau/features/profile/edit_payment/edit_payment_page.dart';
import 'package:cadeau/features/profile/edit_profile/edit_profile_page.dart';
import 'package:cadeau/features/profile/reports%20&%20help/help_page.dart';
import 'package:cadeau/features/profile/reports%20&%20help/reports_help_page.dart';
import 'package:cadeau/features/profile/reports%20&%20help/send_report_page.dart'
    show SendReportPage;
import 'package:cadeau/features/profile/settings/settings_page.dart';
import 'package:cadeau/features/wishlist/screens/wishlist_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: '/', page: () => LoginPage(), middlewares: [Mymiddleware()]),

  // Auth
  GetPage(name: AppRoutes.signup, page: () => SignupPage()),
  GetPage(name: AppRoutes.login, page: () => LoginPage()),
  GetPage(name: AppRoutes.deleteAccount, page: () => DeleteAccountPage()),
  GetPage(name: AppRoutes.forgotpassword, page: () => ForgotpasswordPage()),
  // GetPage(name: AppRoutes.resetpassEmailPage, page: () => ResetpassEmailPage()),
  GetPage(name: AppRoutes.resetpasswordPage, page: () => ResetpasswordPage()),
  GetPage(name: AppRoutes.resetpasswordPage, page: () => ResetpasswordPage()),
  GetPage(
    name: AppRoutes.verificationOtpPage,
    page: () => VerificationAccountPage(),
  ),
  //home
  // GetPage(name: '/', page: () => MainPage()),
  GetPage(name: AppRoutes.mainPage, page: () => MainPage()),
  GetPage(name: AppRoutes.allOcassionPage, page: () => AllOcassionPage()),
  GetPage(name: AppRoutes.allBrands, page: () => AllBrands()),
  GetPage(name: AppRoutes.saerchPage, page: () => SaerchPage()),
  GetPage(name: AppRoutes.productPage, page: () => ProductPage()),
  GetPage(name: AppRoutes.wishlistPage, page: () => WishlistPage()),
  GetPage(name: AppRoutes.allCategoriesPage, page: () => AllCategoriesPage()),
  GetPage(name: AppRoutes.mainCategoryPage, page: () => MainCategoryPage()),
  GetPage(name: AppRoutes.mainOccasionPage, page: () => MainOccasionPage()),
  GetPage(name: AppRoutes.mainBrandPage, page: () => MainBrandPage()),
  //profile
  GetPage(name: AppRoutes.editPaymentPage, page: () => EditPaymentPage()),
  GetPage(name: AppRoutes.editProfilePage, page: () => EditProfilePage()),
  GetPage(name: AppRoutes.reportsHelpPage, page: () => ReportsHelpPage()),
  GetPage(name: AppRoutes.helpPage, page: () => HelpPage()),
  GetPage(name: AppRoutes.sendReportPage, page: () => SendReportPage()),
  GetPage(name: AppRoutes.settingsPage, page: () => SettingsPage()),
  //card
  GetPage(name: AppRoutes.checkoutPage, page: () => CheckoutPage()),
  GetPage(name: AppRoutes.completeAymentPage, page: () => CompleteAymentPage()),
  GetPage(name: AppRoutes.successPay, page: () => SuccessPay()),
];

import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/features/auth/forgotPassword/forgotPassword_page.dart' show ForgotpasswordPage;
import 'package:cadeau/features/auth/forgotPassword/reset/resetpass_email_page.dart';
import 'package:cadeau/features/auth/forgotPassword/reset/resetpass_phone_page.dart';

import 'package:cadeau/features/auth/login/screen/login_page.dart';
import 'package:cadeau/features/auth/resetPassword/resetpassword_page.dart';
import 'package:cadeau/features/auth/signUp/screen/signup_page.dart';
import 'package:cadeau/features/auth/verification/verification_page.dart';
import 'package:cadeau/features/cart/checkout/checkout_page.dart';
import 'package:cadeau/features/cart/complete%20payment/complete_ayment_page.dart';
import 'package:cadeau/features/cart/success_pay.dart';
import 'package:cadeau/features/home/all_brands/all_brands.dart' show AllBrands;
import 'package:cadeau/features/home/all_occasions/all_ocassion_page.dart';
import 'package:cadeau/features/home/product/product_page.dart';
import 'package:cadeau/features/home/search/saerch_page.dart';
import 'package:cadeau/features/main_page.dart';
import 'package:cadeau/features/profile/edit_payment/edit_payment_page.dart';
import 'package:cadeau/features/profile/edit_profile/edit_profile_page.dart';
import 'package:cadeau/features/profile/reports%20&%20help/help_page.dart';
import 'package:cadeau/features/profile/reports%20&%20help/reports_help_page.dart';
import 'package:cadeau/features/profile/reports%20&%20help/send_report_page.dart' show SendReportPage;
import 'package:cadeau/features/profile/settings/settings_page.dart';
import 'package:cadeau/features/wishlist/wishlist_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: '/',
    page: () => LoginPage(),
    // middlewares: [Mymiddleware()]
  ),

  // Auth
  GetPage(name: AppRoutes.signup, page: () => SignupPage()),
  GetPage(name: AppRoutes.login, page: () => LoginPage()),
  GetPage(name: AppRoutes.forgotpassword, page: () => ForgotpasswordPage()),
  GetPage(name: AppRoutes.resetpassEmailPage, page: () => ResetpassEmailPage()),
  GetPage(name: AppRoutes.resetpassPhonePage, page: () => ResetpassPhonePage()),
  GetPage(name: AppRoutes.verificationPage, page: () => VerificationPage()),
  GetPage(name: AppRoutes.resetpasswordPage, page: () => ResetpasswordPage()),
  //home
  GetPage(name: AppRoutes.mainPage, page: () => MainPage()),
  GetPage(name: AppRoutes.allOcassionPage, page: () => AllOcassionPage()),
  GetPage(name: AppRoutes.allBrands, page: () => AllBrands()),
  GetPage(name: AppRoutes.saerchPage, page: () => SaerchPage()),
  GetPage(name: AppRoutes.productPage, page: () => ProductPage()),
  GetPage(name: AppRoutes.wishlistPage, page: () => WishlistPage()),
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

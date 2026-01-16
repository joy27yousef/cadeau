import 'package:cadeau/core/cache/cacheHelper.dart';
import 'package:cadeau/core/data/apis/app_endpoint.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Mymiddleware extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();

  @override
  RouteSettings? redirect(String? route) {
    String? token = CacheHelper().getDataString(key: GeneralKey.token);

    if (token != null && token.isNotEmpty) {
      return RouteSettings(name: AppRoutes.mainPage);
    } else {
      return RouteSettings(name: AppRoutes.login);
    }
  }
}

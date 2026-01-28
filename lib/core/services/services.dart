import 'package:cadeau/core/cache/cacheHelper.dart';
import 'package:cadeau/core/services/service_locator.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreference;
  Future<MyServices> init() async {
    sharedPreference = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
  await CacheHelper().init();
  WidgetsFlutterBinding.ensureInitialized();
  await initServiceLocator();
}

import 'package:cadeau/core/constant/app_theme.dart';
import 'package:cadeau/core/localization/change_local.dart';
import 'package:cadeau/core/localization/translation.dart';
import 'package:cadeau/core/routes/routes.dart';
import 'package:cadeau/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await initialServices();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xffFBFEFF),
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  // Initialbinding().dependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localCtrl = Get.put(localController());

    return Obx(() {
      final isArabic = localCtrl.language.value.languageCode == 'ar';
      return GetMaterialApp(
        locale: localCtrl.language.value,
        debugShowCheckedModeBanner: false,
        theme: isArabic ? arabicTheme : englishTheme,
        title: 'Cadeau',
        getPages: routes,
        translations: MyTranslation(),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(
              context,
            ).copyWith(textScaler: const TextScaler.linear(1.0)),
            child: child!,
          );
        },
      );
    });
  }
}

import 'package:cadeau/core/constant/app_theme.dart';
import 'package:cadeau/core/data/apis/dio_consumer.dart';
import 'package:cadeau/core/localization/change_local.dart';
import 'package:cadeau/core/localization/translation.dart';
import 'package:cadeau/core/routes/routes.dart';
import 'package:cadeau/core/services/services.dart';
import 'package:cadeau/features/brands/data/repository/brands_repo.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_bloc.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_event.dart';
import 'package:cadeau/features/categories/data/repository/categories_repo.dart';
import 'package:cadeau/features/categories/logic/bloc/categories_bloc.dart';
import 'package:cadeau/features/occasions/data/repository/occasion_repo.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_bloc.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_event.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialServices();

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xffFBFEFF),
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CategoriesBloc(
            repo: CategoriesRepo(api: DioConsumer(dio: Dio())),
          )..add(LoadCategories()),
        ),
        BlocProvider(
          create: (_) => BrandsBloc(
            repo: BrandsRepo(api: DioConsumer(dio: Dio())),
          )..add(LoadBrands()),
        ),
        BlocProvider(
          create: (_) => OccasionsBloc(
            repo: OccasionRepo(api: DioConsumer(dio: Dio())),
          )..add(LoadOccasions()),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localCtrl = Get.put(LocaleController());

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

import 'package:cadeau/core/services/service_locator.dart';
import 'package:cadeau/features/search/data/repository/searchProduct_repo.dart';
import 'package:cadeau/features/search/logic/bloc/search_bloc.dart';
import 'package:cadeau/features/search/screens/widgets/product_price_list.dart';
import 'package:cadeau/features/search/screens/widgets/search_input.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class SaerchPage extends StatelessWidget {
  const SaerchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'Search'.tr),
      body: BlocProvider(
        create: (_) => SearchBloc(repo: sl()),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            children: [SearchInput(), SizedBox(height: 30), ProductPriceList()],
          ),
        ),
      ),
    );
  }
}

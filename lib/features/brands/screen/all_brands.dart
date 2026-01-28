import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/services/service_locator.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/categories_all_page.dart';
import 'package:cadeau/core/widgets/empty.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_bloc.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_event.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_state.dart';
import 'package:cadeau/features/categories/screens/widgets/product_all_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'All Brands'.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocProvider(
          create: (_) => sl<BrandsBloc>()..add(LoadBrands()),
          child: ListView(
            children: [
              const SizedBox(height: 20),

              BlocBuilder<BrandsBloc, BrandsState>(
                builder: (context, state) {
                  //  Loading
                  if (state is BrandsLoading) {
                    return const ProductAllCardShimmer();
                  }

                  //  Error
                  if (state is BrandsError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  if (state is BrandsSuccess) {
                    final brands = state.brand.data;
                    if (brands.isNotEmpty) {
                      return CategoriesAllpage(
                        items: brands,
                        getImage: (brand) => brand.brandLogo,
                        getTitle: (brand) => dataTranslation(
                          brand.brandNameArabic,
                          brand.brandNameEnglish,
                        ),
                        onTap: (brand) {
                          Get.toNamed(
                            AppRoutes.mainBrandPage,
                            arguments: {
                              'brandId': brand.brandId,
                              'brandNameArabic': brand.brandNameArabic,
                              'brandNameEnglish': brand.brandNameEnglish,
                            },
                          );
                        },
                      );
                    }
                    return Empty(
                      text1: 'There are currently no products'.tr,
                      text2: '',
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

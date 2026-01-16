import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/categories_all_page.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_bloc.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_event.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_state.dart';
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
        child: ListView(
          children: [
            SizedBox(height: 20),
            BlocBuilder<BrandsBloc, BrandsState>(
              builder: (context, state) {
                final bloc = context.read<BrandsBloc>();
                final cached = bloc.cachedBrands;

                if (cached == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                final brands = cached.data;

                return CategoriesAllpage(
                  items: brands,
                  getImage: (brand) => brand.brandLogo,
                  getTitle: (brand) => dataTranslation(
                    brand.brandNameArabic,
                    brand.brandNameEnglish,
                  ),
                  onTap: (brand) {
                    bloc.add(LoadBrandById(brand.brandId));

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
              },
            ),
          ],
        ),
      ),
    );
  }
}

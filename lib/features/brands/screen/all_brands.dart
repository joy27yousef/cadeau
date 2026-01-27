import 'package:cadeau/core/data/apis/request_status%20.dart';
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
            const SizedBox(height: 20),

            BlocBuilder<BrandsBloc, BrandsState>(
              buildWhen: (previous, current) =>
                  previous.brandsStatus != current.brandsStatus ||
                  previous.brands != current.brands,
              builder: (context, state) {
                //  Loading
                if (state.brandsStatus == RequestStatus.loading) {
                  return const Center(child: CircularProgressIndicator());
                }

                //  Error
                if (state.brandsStatus == RequestStatus.failure) {
                  return Center(
                    child: Text(
                      state.error ?? 'Something went wrong',
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                  );
                }

                final brands = state.brands!.data;

                return CategoriesAllpage(
                  items: brands,
                  getImage: (brand) => brand.brandLogo,
                  getTitle: (brand) => dataTranslation(
                    brand.brandNameArabic,
                    brand.brandNameEnglish,
                  ),
                  onTap: (brand) {
                    context.read<BrandsBloc>().add(
                      LoadBrandById(brand.brandId),
                    );

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

import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/product_all_card.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_bloc.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_state.dart';
import 'package:cadeau/features/categories/screens/widgets/product_all_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class MainBrandPage extends StatelessWidget {
  const MainBrandPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final String? brandNameArabic = args?['brandNameArabic'];
    final String? brandNameEnglish = args?['brandNameEnglish'];

    return Scaffold(
      appBar: AppbarScreens(
        title: dataTranslation(brandNameArabic, brandNameEnglish),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<BrandsBloc, BrandsState>(
          builder: (context, state) {
            //  Loading
            if (state is BrandsLoading) {
              return const ProductAllCardShimmer();
            }

            //  Success
            if (state is BrandByIdSuccess) {
              final data = state.brand.data;

              //  Products
              if (data.products.isNotEmpty) {
                return ProductAllCard(
                  items: data.products,
                  getImage: (prod) => prod.productImage,
                  getTitle: (prod) => dataTranslation(
                    prod.productNameArabic,
                    prod.productNameEnglish,
                  ),
                  getPrice: (prod) => prod.productPrice,
                  onTap: (prod) {},
                );
              }

              //  Empty State
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.empty, height: 180),
                    const SizedBox(height: 10),
                    Text(
                      'There are currently no products'.tr,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColor.darkGray,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              );
            }

            //  Error
            if (state is BrandsError) {
              return Center(
                child: Text(
                  'Error: ${state.message}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            //  Fallback
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/empty.dart';
import 'package:cadeau/core/widgets/title_home.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_bloc.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_state.dart';
import 'package:cadeau/features/brands/screen/widgets/home_brand_skeleton.dart';
import 'package:cadeau/features/categories/screens/widgets/product_all_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomeBrands extends StatelessWidget {
  const HomeBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHome(
          text: 'Shop By Brand'.tr,
          viewAll: true,
          onTap: () {
            Get.toNamed(AppRoutes.allBrands);
          },
        ),
        const SizedBox(height: 15),

        BlocBuilder<BrandsBloc, BrandsState>(
          builder: (context, state) {
            //  Loading
            if (state.isBrandsLoading) {
              return const HomeBrandsSkeleton();
            }

            // error
            if (state.brandsErrorMessage != null) {
              return Center(
                child: Text(
                  state.brandsErrorMessage!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              );
            }
            //BrandsSuccess
            if (state.brandsModel != null) {
              final brands = state.brandsModel!.data.take(6).toList();
              if (brands.isNotEmpty) {
                return SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: brands.length,
                    itemBuilder: (context, i) {
                      final brand = brands[i];

                      return InkWell(
                        onTap: () {
                          Get.toNamed(
                            AppRoutes.mainBrandPage,
                            arguments: {
                              'brandId': brand.brandId,
                              'brandNameArabic': brand.brandNameArabic,
                              'brandNameEnglish': brand.brandNameEnglish,
                            },
                          );
                        },

                        borderRadius: BorderRadius.circular(20),
                        child: Column(
                          children: [
                            Container(
                              height: 120,
                              width: 130,
                              padding: EdgeInsets.all(20),
                              margin: const EdgeInsets.only(left: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.network(
                                brand.brandLogo,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              dataTranslation(
                                brand.brandNameArabic,
                                brand.brandNameEnglish,
                              ),
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(
                                    color: AppColor.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }
              //Empty
              return Empty(
                text1: 'There are currently no products'.tr,
                text2: '',
              );
            }
            return const SizedBox.shrink();
          },
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}

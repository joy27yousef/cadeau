import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/empty.dart';
import 'package:cadeau/core/widgets/title_home.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_bloc.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_state.dart';
import 'package:cadeau/features/home/widgets/home_brand_skeleton.dart';
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
            if (state is BrandsLoading) {
              return const HomeBrandsSkeleton();
            }

            // error
            if (state is BrandsError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              );
            }
            //BrandsSuccess
            if (state is BrandsSuccess) {
              final data = state.brand.data.take(6).toList();
              if (data.isNotEmpty) {
                return SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      final brand = data[i];

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
                        child: Container(
                          height: 65,
                          width: 130,
                          padding: EdgeInsets.all(10),
                          margin: const EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            image: DecorationImage(
                              image: NetworkImage(brand.brandLogo),
                              fit: BoxFit.cover,
                            ),
                          ),
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

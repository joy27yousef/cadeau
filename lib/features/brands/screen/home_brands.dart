import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/title_home.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_bloc.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_event.dart';
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
        SizedBox(height: 15),
        BlocBuilder<BrandsBloc, BrandsState>(
          builder: (context, state) {
            final bloc = context.read<BrandsBloc>();
            final cached = bloc.cachedBrands;

            if (cached == null) {
              return const HomeBrandsSkeleton();
            }

            final brands = cached.data.take(6).toList();
            return SizedBox(
              height: 65,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, i) {
                  final brand = brands[i];
                  return InkWell(
                    onTap: () {
                      bloc.add(LoadBrandById(brand.brandId));
                      print(brand.brandNameEnglish);
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
                      margin: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                          image: NetworkImage(brands[i].brandLogo),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
        SizedBox(height: 30),
      ],
    );
  }
}

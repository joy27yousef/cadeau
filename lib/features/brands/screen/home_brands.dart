import 'package:cadeau/core/data/apis/request_status%20.dart';
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
        const SizedBox(height: 15),

        BlocBuilder<BrandsBloc, BrandsState>(
          buildWhen: (previous, current) =>
              previous.brandsStatus != current.brandsStatus ||
              previous.brands != current.brands,
          builder: (context, state) {
            //  Loading
            if (state.brandsStatus == RequestStatus.loading) {
              return const HomeBrandsSkeleton();
            }

            // error
            if (state.brandsStatus == RequestStatus.failure) {
              return Center(
                child: Text(
                  state.error ?? 'Something went wrong',
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              );
            }

            final brands = state.brands!.data.take(6).toList();

            return SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: brands.length,
                itemBuilder: (context, i) {
                  final brand = brands[i];

                  return InkWell(
                    onTap: () {
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
          },
        ),

        const SizedBox(height: 30),
      ],
    );
  }
}

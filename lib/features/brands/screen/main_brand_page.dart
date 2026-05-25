import 'package:cadeau/core/cache/cacheHelper.dart';
import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_endpoint.dart';
import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/services/service_locator.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/empty.dart';
import 'package:cadeau/core/widgets/product_all_card.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_bloc.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_event.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_state.dart';
import 'package:cadeau/features/brands/screen/widgets/brand_name_and_disc.dart';
import 'package:cadeau/features/brands/screen/widgets/brand_numbers.dart';
import 'package:cadeau/features/brands/screen/widgets/logo_and_image.dart';
import 'package:cadeau/features/categories/screens/widgets/product_all_card_shimmer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class MainBrandPage extends StatelessWidget {
  const MainBrandPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final String brandId = args['brandId'];
    final String? brandNameArabic = args['brandNameArabic'];
    final String? brandNameEnglish = args['brandNameEnglish'];
    String token = CacheHelper().getData(key: GeneralKey.token);

    return Scaffold(
      appBar: AppbarScreens(
        title: dataTranslation(brandNameArabic, brandNameEnglish),
      ),
      body: BlocProvider(
        create: (_) => sl<BrandsBloc>()..add(LoadBrandById(brandId, token)),
        child: BlocBuilder<BrandsBloc, BrandsState>(
          builder: (context, state) {
            // 1. Loading State
            if (state.isBrandByIdLoading) {
              return const ProductAllCardShimmer();
            }

            // 2. Error State
            if (state.brandByIdErrorMessage != null) {
              return Center(
                child: Text(
                  state.brandByIdErrorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            // 3. Success State
            if (state.brandByIdModel != null) {
              final products = state.brandByIdModel!.data.products;

              return ListView(
                children: [
                  LogoAndImage(
                    url: state.brandByIdModel!.data.brand.brandLogo,
                    backimage: state.brandByIdModel!.data.brand.brandCoverImg,
                    isFollow: state.isFollowing,
                    brandId: state.brandByIdModel!.data.brand.brandId,
                  ),
                  BrandNameAndDisc(
                    name: dataTranslation(brandNameArabic, brandNameEnglish),
                    disc: dataTranslation(
                      state.brandByIdModel!.data.brand.brandDescriptionArabic,
                      state.brandByIdModel!.data.brand.brandDescriptionEnglish,
                    ),
                  ),

                  BrandNumbers(
                    numFoll: '${state.brandByIdModel!.data.followersCount}',
                    numProduct: '${products.length}',
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 20,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'The Collection',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Icon(Icons.filter_list, color: AppColor.secondBlack),
                      ],
                    ),
                  ),

                  if (products.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ProductAllCard(
                        items: products,
                        getImage: (prod) => prod.productImage,
                        getTitle: (prod) => dataTranslation(
                          prod.productNameArabic,
                          prod.productNameEnglish,
                        ),
                        getPrice: (prod) => prod.productPrice,
                        onTap: (prod) {
                          Get.toNamed(
                            AppRoutes.productPage,
                            arguments: {'productId': prod.productId},
                          );
                        },
                      ),
                    )
                  else
                    Empty(
                      isSmoll: true,
                      text1: 'There are currently no products'.tr,
                      text2: '',
                    ),
                  SizedBox(height: 30),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

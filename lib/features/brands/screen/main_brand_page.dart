import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/services/service_locator.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/empty.dart';
import 'package:cadeau/core/widgets/product_all_card.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_bloc.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_event.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_state.dart';
import 'package:cadeau/features/categories/screens/widgets/product_all_card_shimmer.dart';
import 'package:cadeau/features/product/logic/bloc/product_bloc.dart';
import 'package:cadeau/features/product/logic/bloc/product_event.dart';
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
    return BlocProvider(
      create: (_) => sl<BrandsBloc>()..add(LoadBrandById(brandId)),
      child: Scaffold(
        appBar: AppbarScreens(
          title: dataTranslation(brandNameArabic, brandNameEnglish),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<BrandsBloc, BrandsState>(
            builder: (context, state) {
              //loading
              if (state is BrandsByIdLoading) {
                return const ProductAllCardShimmer();
              }
              //error
              if (state is BrandsByIdError) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                  ),
                );
              }
              //Success
              if (state is BrandByIdSuccess) {
                final products = state.brand.data.products;

                if (products.isNotEmpty) {
                  return ProductAllCard(
                    items: products,
                    getImage: (prod) => prod.productImage,
                    getTitle: (prod) => dataTranslation(
                      prod.productNameArabic,
                      prod.productNameEnglish,
                    ),
                    getPrice: (prod) => prod.productPrice,
                    onTap: (prod) {
                      context.read<ProductBloc>().add(
                        LoadProductById(prod.productId),
                      );
                      Get.toNamed(AppRoutes.productPage);
                    },
                  );
                }
                //empty
                return Empty(
                  text1: 'There are currently no products'.tr,
                  text2: '',
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}

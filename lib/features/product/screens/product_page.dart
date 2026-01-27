import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';
import 'package:cadeau/features/categories/screens/widgets/product_all_card_shimmer.dart';
import 'package:cadeau/features/product/logic/bloc/product_bloc.dart';
import 'package:cadeau/features/product/logic/bloc/product_state.dart';
import 'package:cadeau/features/product/screens/widgets/product_bottom.dart';
import 'package:cadeau/features/product/screens/widgets/product_details.dart';
import 'package:cadeau/features/product/screens/widgets/product_images.dart';
import 'package:cadeau/features/product/screens/widgets/product_information.dart';
import 'package:cadeau/features/product/screens/widgets/product_variants.dart';
import 'package:cadeau/features/home/widgets/home_cadeau_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: ''),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: BlocBuilder<ProductBloc, ProductState>(
          builder: (context, state) {
            ///  Loading
            if (state is ProductLoading) {
              return const ProductAllCardShimmer();
            }

            ///  Error
            if (state is ProductError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              );
            }

            /// Success
            if (state is ProductByIdSuccess) {
              final data = state.product.data;

              return Stack(
                children: [
                  ListView(
                    padding: const EdgeInsets.only(bottom: 110),
                    children: [
                      ProductImages(images: data.images),

                      /// ℹ Info
                      ProductInformation(
                        name: dataTranslation(
                          data.productNameArabic,
                          data.productNameEnglish,
                        ),
                        price:
                            state.selectedVariant?.variantPrice ?? data.price,
                        productId: data.productId,
                        brand: dataTranslation(
                          data.brandNameArabic,
                          data.brandNameEnglish,
                        ),
                        description: dataTranslation(
                          data.productDescriptionArabic,
                          data.productDescriptionEnglish,
                        ),
                      ),

                      ///  Variants
                      if ((data.variants).isNotEmpty) const ProductVariants(),

                      ///  Details
                      ProductDetails(
                        features: (Get.locale?.languageCode == 'en')
                            ? (data.featuresEnglish)
                            : (data.featuresArabic),
                      ),

                      const HomeCadeauBox(),
                    ],
                  ),

                  ///  Bottom Button
                  ProductBottom(
                    id: data.productId,
                    box: BoxButtom(
                      color:
                          (state.selectedVariant?.inStock == true ||
                              state.selectedVariant == null)
                          ? AppColor.mainColor
                          : Colors.grey.shade300,
                      ontapfun: () {
                        if (state.selectedVariant?.inStock == true ||
                            state.selectedVariant == null) {}
                      },
                      text: state.selectedVariant == null
                          ? 'Add To Cart'.tr
                          : (state.selectedVariant!.inStock
                                ? 'Add To Cart'.tr
                                : 'Product not available'.tr),
                    ),
                  ),
                ],
              );
            }

            ///  Initial / Fallback
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

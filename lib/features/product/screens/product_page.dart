import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/functions/message.dart';
import 'package:cadeau/core/services/service_locator.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';
import 'package:cadeau/features/cart/logic/bloc/cart_bloc.dart';
import 'package:cadeau/features/product/logic/bloc/product_bloc.dart';
import 'package:cadeau/features/product/logic/bloc/product_event.dart';
import 'package:cadeau/features/product/logic/bloc/product_state.dart';
import 'package:cadeau/features/product/screens/widgets/product_bottom.dart';
import 'package:cadeau/features/product/screens/widgets/product_details.dart';
import 'package:cadeau/features/product/screens/widgets/product_images.dart';
import 'package:cadeau/features/product/screens/widgets/product_information.dart';
import 'package:cadeau/features/product/screens/widgets/product_page_shimmer.dart';
import 'package:cadeau/features/product/screens/widgets/product_ratings.dart';
import 'package:cadeau/features/product/screens/widgets/product_variants.dart';
import 'package:cadeau/features/home/widgets/home_cadeau_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final String productId = args?['productId'];

    return Scaffold(
      appBar: AppbarScreens(title: ''),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => sl<ProductBloc>()..add(LoadProductById(productId)),
          ),

          BlocProvider(create: (_) => sl<CartBloc>()),
        ],
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: BlocConsumer<CartBloc, CartState>(
            listener: (context, state) {
              if (state is CartActionSuccess) {
                showMessage(context, message: state.message, isSuccess: true);
              } else if (state is CartError) {
                showMessage(context, message: state.message, isSuccess: false);
              }
            },

            builder: (context, cartState) {
              return BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  /// Loading
                  if (state is ProductLoading) {
                    return const ProductPageShimmer();
                  }

                  /// Error
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

                            /// Info
                            ProductInformation(
                              name: dataTranslation(
                                data.productNameArabic,
                                data.productNameEnglish,
                              ),
                              price:
                                  state.selectedVariant?.variantPrice ??
                                  data.price,
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

                            /// Variants
                            if ((data.variants).isNotEmpty)
                              const ProductVariants(),

                            /// Details
                            ProductDetails(
                              features: (Get.locale?.languageCode == 'en')
                                  ? data.featuresEnglish
                                  : data.featuresArabic,
                            ),

                            const HomeCadeauBox(),

                            ProductRatings(
                              ratings: data.ratings,
                              productId: data.productId,
                            ),
                          ],
                        ),

                        /// Bottom Button
                        ProductBottom(
                          id: data.productId,
                          box: BoxButtom(
                            color:
                                (state.selectedVariant?.inStock == true ||
                                    state.selectedVariant == null)
                                ? AppColor.mainColor
                                : Colors.grey.shade300,

                            ontapfun: () {
                              if (state.selectedVariant != null) {
                                if (state.selectedVariant!.inStock) {
                                  context.read<CartBloc>().add(
                                    AddToCartEvent(
                                      productId: int.parse(data.productId),
                                      variantId: int.parse(
                                        state.selectedVariant!.variantId,
                                      ),
                                      quantity: 1,
                                    ),
                                  );
                                } else {
                                  showMessage(
                                    context,
                                    message: 'Product not available'.tr,
                                    isSuccess: false,
                                  );
                                }
                              } else {
                                showMessage(
                                  context,
                                  message: 'Please select a variant'.tr,
                                  isSuccess: false,
                                );
                              }
                            },

                            text: cartState is CartLoading
                                ? 'Loading...'.tr
                                : state.selectedVariant == null
                                ? 'Add To Cart'.tr
                                : (state.selectedVariant!.inStock
                                      ? 'Add To Cart'.tr
                                      : 'Product not available'.tr),
                          ),
                        ),
                      ],
                    );
                  }

                  return const SizedBox.shrink();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

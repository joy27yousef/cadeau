import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/empty.dart';
import 'package:cadeau/features/cart/logic/bloc/cart_bloc.dart';
import 'package:cadeau/features/cart/screens/widgets/cart_product.dart';
import 'package:cadeau/features/cart/screens/widgets/cart_summary.dart';
import 'package:cadeau/features/wishlist/screens/widgets/wishlist_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppbarMainScreens(),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return const Padding(
              padding: EdgeInsets.all(20),
              child: Center(child: WishlistSkeleton()),
            );
          }

          if (state is CartSuccess) {
            if (state.cart.data == null || state.cart.data!.cartItems.isEmpty) {
              return Empty(
                text1: 'Your cart is empty'.tr,
                text2: 'Add some beautiful items to start gifting!'.tr,
              );
            }

            final cartItems = state.cart.data!.cartItems;

            return RefreshIndicator(
              color: AppColor.mainColor,
              backgroundColor: AppColor.background,
              onRefresh: () async {
                context.read<CartBloc>().add(GetCartEvent());
                await Future.delayed(const Duration(seconds: 2));
              },
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final item = cartItems[index];

                        final double parsedPrice =
                            double.tryParse(item.productPrice) ?? 0.0;
                        final int parsedQuantity =
                            int.tryParse(item.quantity) ?? 1;

                        return CartProduct(
                          productId: item.productId,
                          productName: dataTranslation(
                            item.productNameArabic,
                            item.productNameEnglish,
                          ),
                          productImage: item.productImage,
                          price: parsedPrice,
                          quantity: parsedQuantity,
                          variantId: item.variantId,
                        );
                      },
                    ),
                  ),

                  CartSummary(
                    total: state.totalPrice,
                    count: cartItems.length,
                    onCheckout: () {
                      Get.toNamed(AppRoutes.checkoutPage);
                    },
                  ),
                ],
              ),
            );
          }

          // حالة الخطأ أو أي حالة غير متوقعة
          return Empty(
            text1: 'Something went wrong'.tr,
            text2: 'Please try again later'.tr,
          );
        },
      ),
    );
  }
}

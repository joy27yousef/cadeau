import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/core/functions/confirmation_alert.dart';
import 'package:cadeau/features/cart/logic/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class CartProduct extends StatelessWidget {
  final String productId;
  final String productName;
  final String productImage;
  final double price;
  final int quantity;
  final String variantId;

  const CartProduct({
    super.key,
    required this.productId,
    required this.productName,
    required this.productImage,
    required this.price,
    required this.quantity,
    required this.variantId,
  });

  @override
  Widget build(BuildContext context) {
    final totalItemPrice = (quantity * price);

    return Dismissible(
      key: ValueKey(variantId),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.red.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(Iconsax.trash, color: Colors.red, size: 24),
      ),
      confirmDismiss: (_) async {
        final result = await confirmationAelrt(
          AppImages.delete,
          'Do you really want to delete the product from the cart?'.tr,
          'Cancel'.tr,
          'Yes, Delete'.tr,
          Colors.red,
          false,
          null,
        );

        if (result == true) {
          context.read<CartBloc>().add(
            RemoveFromCartEvent(
              variantId: int.tryParse(variantId) ?? 0,
              productId: int.tryParse(productId) ?? 0,
              quantity: quantity,
            ),
          );
        }
        return result ?? false;
      },
      onDismissed: (_) {},
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade100),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade100,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          children: [
            // صورة المنتج
            Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(productImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),

            // تفاصيل المنتج والأزرار
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          productName,
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(fontSize: 15, color: AppColor.black),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () async {
                          final result = await confirmationAelrt(
                            AppImages.delete,
                            'Do you really want to delete the product from the cart?'
                                .tr,
                            'Cancel'.tr,
                            'Yes, Delete'.tr,
                            Colors.red,
                            false,
                            null,
                          );
                          if (result == true) {
                            context.read<CartBloc>().add(
                              RemoveFromCartEvent(
                                variantId: int.tryParse(variantId) ?? 0,
                                productId: int.tryParse(productId) ?? 0,
                                quantity: quantity,
                              ),
                            );
                          }
                        },
                        child: Icon(
                          Iconsax.trash,
                          color: Colors.red.shade400,
                          size: 18,
                        ),
                      ),
                    ],
                  ),

                  BlocBuilder<CartBloc, CartState>(
                    builder: (context, state) {
                      if (state is! CartSuccess || state.cart.data == null)
                        return const SizedBox();

                      final currentItem = state.cart.data!.cartItems.firstWhere(
                        (e) => e.variantId == variantId,
                        orElse: () => state.cart.data!.cartItems.first,
                      );

                      final bool isArabic =
                          Localizations.localeOf(context).languageCode == 'ar';
                      final attrs = isArabic
                          ? currentItem.variantAttributesAr
                          : currentItem.variantAttributesEn;

                      if (attrs.isEmpty) return const SizedBox();
                      final attrText = attrs.entries
                          .map((e) => '${e.key}: ${e.value}')
                          .join(' | ');

                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Text(
                          attrText,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: 13,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                              ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 12),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // السعر الكلي
                      Text(
                        '\$${totalItemPrice.toStringAsFixed(2)}',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 16,
                          color: AppColor.mainColor,
                        ),
                      ),

                      // أزرار التحكم بالكمية
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              constraints: const BoxConstraints(),
                              padding: const EdgeInsets.all(6),
                              icon: const Icon(
                                Iconsax.minus,
                                size: 15,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                if (quantity <= 1) return;
                                context.read<CartBloc>().add(
                                  RemoveFromCartEvent(
                                    variantId: int.tryParse(variantId) ?? 0,
                                    productId: int.tryParse(productId) ?? 0,
                                    quantity: 1,
                                  ),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Text(
                                '$quantity',
                                style: Theme.of(context).textTheme.titleLarge!
                                    .copyWith(
                                      fontSize: 15,
                                      color: AppColor.black,
                                    ),
                              ),
                            ),
                            IconButton(
                              constraints: const BoxConstraints(),
                              padding: const EdgeInsets.all(6),
                              icon: const Icon(
                                Iconsax.add,
                                size: 15,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                context.read<CartBloc>().add(
                                  AddToCartEvent(
                                    productId: int.tryParse(productId) ?? 0,
                                    variantId: int.tryParse(variantId) ?? 0,
                                    quantity: 1,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

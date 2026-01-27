import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/empty.dart';
import 'package:cadeau/core/widgets/love.dart';
import 'package:cadeau/features/wishlist/logic/bloc/wishlist_bloc.dart';
import 'package:cadeau/features/wishlist/logic/bloc/wishlist_state.dart';
import 'package:cadeau/features/wishlist/screens/widgets/wishlist_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/utils.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarMainScreens(),
      body: const Padding(padding: EdgeInsets.all(20), child: _WishlistBody()),
    );
  }
}

class _WishlistBody extends StatelessWidget {
  const _WishlistBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        final wishlistItems =
            context.read<WishlistBloc>().cachedWishlist?.data?.wishlistItems ??
            [];

        // Loading
        if (state is WishlistLoading && wishlistItems.isEmpty) {
          return const WishlistSkeleton();
        }

        // Error
        if (state is WishlistError) {
          return Empty(
            text1: 'Your wishlist is empty'.tr,
            text2: 'Add some products you love!'.tr,
          );
        }

        // Empty
        if (wishlistItems.isEmpty) {
          return Empty(
            text1: 'Your wishlist is empty'.tr,
            text2: 'Add some products you love!'.tr,
          );
        }

        // Success
        return ListView.builder(
          itemCount: wishlistItems.length,
          itemBuilder: (context, index) {
            final item = wishlistItems[index];

            return Container(
              height: 140,
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColor.background,
                boxShadow: [
                  BoxShadow(color: Colors.grey.shade200, blurRadius: 12),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //  Product Image
                  Container(
                    height: 110,
                    width: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: item.productImage.isNotEmpty
                            ? NetworkImage(item.productImage)
                            : const AssetImage(AppImages.empty)
                                  as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  //  Product Info + Love Button
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title + Heart
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                dataTranslation(item.nameAr, item.nameEn),
                                maxLines: 2,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.titleMedium!
                                    .copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColor.black,
                                    ),
                              ),
                            ),
                            const SizedBox(width: 6),
                            Love(id: item.id),
                          ],
                        ),

                        const SizedBox(height: 6),

                        // Description
                        Text(
                          dataTranslation(
                            item.descriptionAr,
                            item.descriptionEn,
                          ),
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                fontSize: 12,
                                color: AppColor.secondBlack,
                              ),
                        ),

                        const Spacer(),

                        // Price
                        Text(
                          '\$${item.price}',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: AppColor.mainColor,
                              ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

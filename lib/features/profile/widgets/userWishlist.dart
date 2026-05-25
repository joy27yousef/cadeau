import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/empty.dart';
import 'package:cadeau/core/widgets/love.dart';
import 'package:cadeau/core/widgets/title_home.dart';
import 'package:cadeau/features/home/widgets/top_product_loading.dart';
import 'package:cadeau/features/wishlist/logic/bloc/wishlist_bloc.dart';
import 'package:cadeau/features/wishlist/logic/bloc/wishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class Userwishlist extends StatelessWidget {
  const Userwishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WishlistBloc, WishlistState>(
      builder: (context, state) {
        if (state is WishlistLoading) {
          return TopProductLoading();
        }

        if (state is WishlistError) {
          return Center(child: Text(state.message));
        }
        if (state is LoadWishlistSuccess) {
          final product = state.wishlist.data?.wishlistItems ?? [];
          if (product.isNotEmpty) {
            return Column(
              children: [
                SizedBox(height: 20),
                SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: product.length,
                    itemBuilder: (context, i) => InkWell(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.productPage,
                          arguments: {'productId': product[i].id},
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            height: 208,
                            width: 150,
                            margin: const EdgeInsets.only(left: 20),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        product[i].productImage,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  dataTranslation(
                                    product[i].nameAr,
                                    product[i].nameEn,
                                  ),
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                      ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),

                                SizedBox(height: 3),
                                Text(
                                  product[i].price,
                                  style: Theme.of(context).textTheme.titleLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16,
                                        color: AppColor.mainColor,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          Love(id: product[i].id),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else if (product.isEmpty) {
            return Empty(
              text1: 'Your wishlist is empty'.tr,
              text2: 'Add some products you love!'.tr,
              isSmoll: true,
            );
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}

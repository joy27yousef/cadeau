import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/title_home.dart';
import 'package:cadeau/features/product/logic/bloc/product_bloc.dart';
import 'package:cadeau/features/product/logic/bloc/product_event.dart';
import 'package:cadeau/features/product/logic/bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class TopSellerProduct extends StatelessWidget {
  const TopSellerProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHome(text: 'Top Seller'.tr, viewAll: false, onTap: () {}),
        const SizedBox(height: 15),

        SizedBox(
          height: 210,
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                SizedBox(
                  height: 210,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, i) => Container(
                      width: 150,
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                );
              }

              if (state is ProductError) {
                return Center(child: Text(state.message));
              }

              if (state is ProductSuccess) {
                final products = state.products.data;

                if (products.isEmpty) {
                  return const Center(child: Text('No products'));
                }

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length > 10 ? 10 : products.length,
                  itemBuilder: (context, i) {
                    final product = products[i];

                    return InkWell(
                      onTap: () {
                        final productBloc = context.read<ProductBloc>();
                        productBloc.add(LoadProductById(product.productId));
                        Get.toNamed(AppRoutes.productPage);
                      },
                      borderRadius: BorderRadius.circular(5),
                      child: Container(
                        height: 208,
                        width: 150,
                        margin: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    image: DecorationImage(
                                      image: NetworkImage(product.productImage),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),

                                // ⭐
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.8),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 14,
                                        ),
                                        const SizedBox(width: 3),
                                        Text(
                                          product.productRating.toString(),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 8),

                            Text(
                              product.productNameEnglish,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.titleLarge!
                                  .copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                  ),
                            ),
                            const SizedBox(height: 3),

                            Text(
                              '\$${product.productPrice}',
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
                    );
                  },
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),

        SizedBox(height: 30),
      ],
    );
  }
}

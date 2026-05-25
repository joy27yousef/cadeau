import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/services/service_locator.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';
import 'package:cadeau/core/widgets/empty.dart';
import 'package:cadeau/features/product/logic/bloc/product_bloc.dart';
import 'package:cadeau/features/product/logic/bloc/product_event.dart';
import 'package:cadeau/features/product/logic/bloc/product_state.dart';
import 'package:cadeau/features/product/screens/widgets/rting_list_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class AllRatingPage extends StatelessWidget {
  const AllRatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final String productId = args?['productId'];
    return Scaffold(
      appBar: AppbarScreens(title: 'product reviews'.tr),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: BoxButtom(
            color: AppColor.mainColor,
            ontapfun: () {
              Get.toNamed(
                AppRoutes.addRatingPage,
                arguments: {'productId': productId},
              );
            },
            text: 'Add Review'.tr,
          ),
        ),
      ),

      body: BlocProvider(
        create: (_) => sl<ProductBloc>()..add(LoadProductById(productId)),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocBuilder<ProductBloc, ProductState>(
            builder: (context, state) {
              if (state is ProductLoading) {
                return const RatingListShimmer();
              }

              if (state is ProductError) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                );
              }

              if (state is ProductByIdSuccess) {
                final ratings = state.product.data.ratings;

                if (ratings.isNotEmpty) {
                  return ListView.builder(
                    padding: const EdgeInsets.only(bottom: 80),
                    itemCount: ratings.length,
                    itemBuilder: (context, i) => Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                ratings[i].userName,
                                style: Theme.of(
                                  context,
                                ).textTheme.titleLarge!.copyWith(fontSize: 16),
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Iconsax.star1,
                                    color: Colors.amber,
                                  ),
                                  const SizedBox(width: 2),
                                  Text(
                                    "${ratings[i].rating}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            ratings[i].review ?? '',
                            style: Theme.of(context).textTheme.titleLarge!
                                .copyWith(
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return const Empty(text1: "text1", text2: "text2");
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}

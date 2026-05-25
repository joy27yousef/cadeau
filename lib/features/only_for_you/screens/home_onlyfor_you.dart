import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';
import 'package:cadeau/core/widgets/title_home.dart';
import 'package:cadeau/features/only_for_you/logic/bloc/only_for_you_bloc.dart';
import 'package:cadeau/features/only_for_you/logic/bloc/only_for_you_state.dart';
import 'package:cadeau/features/only_for_you/screens/widgets/only_for_you_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomeOnlyforu extends StatelessWidget {
  const HomeOnlyforu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHome(text: 'Only For You'.tr),
        const SizedBox(height: 15),

        BlocBuilder<OnlyForYouBloc, OnlyForYouState>(
          builder: (context, state) {
            if (state is OnlyForYouLoading) {
              return HomeOnlyForYouSkeleton();
            }

            if (state is OnlyForYouFailure) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    state.errorModel,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            }

            if (state is OnlyForYouSuccess) {
              final products = state.onlyForYouModel.data ?? [];

              if (products.isEmpty) {
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("لا توجد منتجات حالياً"),
                  ),
                );
              }

              return ListView.builder(
                shrinkWrap: true, // مهم لأن الـ ListView داخل Column
                physics:
                    const NeverScrollableScrollPhysics(), // لمنع تضارب التمرير
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];

                  return Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    height: 130,
                    child: Row(
                      children: [
                        Container(
                          height: 124,
                          width: 124,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(product.image ?? ''),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),

                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    dataTranslation(
                                      product.nameAr,
                                      product.nameEn,
                                    ),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: AppColor.secondBlack,
                                        ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '\$${product.price}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16,
                                          color: AppColor.mainColor,
                                        ),
                                  ),
                                ],
                              ),

                              SizedBox(
                                height: 30,
                                width: 120,
                                child: BoxButtom(
                                  color: AppColor.mainColor,
                                  ontapfun: () {
                                    Get.toNamed(
                                      AppRoutes.productPage,
                                      arguments: {
                                        'productId': product.productId,
                                      },
                                    );
                                  },
                                  text: 'View Details'.tr,
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
            }

            return const SizedBox.shrink();
          },
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}

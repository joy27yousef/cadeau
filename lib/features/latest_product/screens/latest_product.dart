import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/empty.dart';
import 'package:cadeau/core/widgets/love.dart';
import 'package:cadeau/core/widgets/title_home.dart';
import 'package:cadeau/features/latest_product/logic/bloc/Latest_product_bloc.dart';
import 'package:cadeau/features/latest_product/logic/bloc/Latest_product_state.dart';
import 'package:cadeau/features/latest_product/screens/widgets/latest_card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LatestProduct extends StatelessWidget {
  const LatestProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHome(text: 'Latest'.tr, viewAll: false, onTap: () {}),
        SizedBox(height: 15),

        BlocBuilder<LatestProductBloc, LatestProductState>(
          builder: (context, state) {
            ///  Loading
            if (state is LatestProductLoading) {
              return LatestCardLoading();
            }

            ///  Error
            if (state is LatestProductError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              );
            }

            /// Success
            if (state is LatestProductSuccess) {
              final product = state.products.data;
              if (product.isNotEmpty) {
                return SizedBox(
                  height: 220,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: product.length,
                    itemBuilder: (context, i) => InkWell(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.productPage,
                          arguments: {'productId': product[i].productId},
                        );
                      },
                      borderRadius: BorderRadius.circular(10),
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
                                    product[i].productNameArabic,
                                    product[i].productNameEnglish,
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
                                  product[i].productPrice,
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
                          Love(id: product[i].productId),
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Empty(
                text1: 'There are currently no products'.tr,
                text2: '',
              );
            }

            return const SizedBox.shrink();
          },
        ),

        SizedBox(height: 30),
      ],
    );
  }
}

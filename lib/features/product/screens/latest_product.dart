import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/title_home.dart';
import 'package:cadeau/features/product/logic/bloc/product_bloc.dart';
import 'package:cadeau/features/product/logic/bloc/product_event.dart';
import 'package:cadeau/features/product/logic/bloc/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

class LatestProduct extends StatelessWidget {
  const LatestProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHome(text: 'Latest'.tr, viewAll: false, onTap: () {}),
        SizedBox(height: 15),

        BlocBuilder<ProductBloc, ProductState>(
          buildWhen: (previous, current) {
            return current is ProductLatestSuccess ||
                current is ProductError ||
                current is ProductLoading;
          },
          builder: (context, state) {
            final bloc = context.read<ProductBloc>();
            final cached = bloc.cachedLatestProduct;

            ///  Loading
            if (state is ProductLoading) {
              return SizedBox(
                height: 210,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
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
            if (state is ProductLatestSuccess) {
              return SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cached?.data.length,
                  itemBuilder: (context, i) => InkWell(
                    onTap: () {
                      final productBloc = context.read<ProductBloc>();
                      productBloc.add(
                        LoadProductById(cached!.data[i].productId),
                      );
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
                          Container(
                            height: 150,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: NetworkImage(
                                  cached!.data[i].productImage,
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            dataTranslation(
                              cached.data[i].productNameArabic,
                              cached.data[i].productNameEnglish,
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
                            cached.data[i].productPrice,
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
                  ),
                ),
              );
            }

            ///  Initial / Fallback
            return const SizedBox.shrink();
          },
        ),

        SizedBox(height: 30),
      ],
    );
  }
}

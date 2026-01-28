import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/empty.dart';
import 'package:cadeau/core/widgets/product_all_card.dart';
import 'package:cadeau/features/categories/screens/widgets/product_all_card_shimmer.dart';
import 'package:cadeau/features/product/logic/bloc/product_bloc.dart';
import 'package:cadeau/features/product/logic/bloc/product_event.dart';
import 'package:cadeau/features/search/logic/bloc/search_bloc.dart';
import 'package:cadeau/features/search/logic/bloc/search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductPriceList extends StatelessWidget {
  const ProductPriceList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        //  Loading
        if (state is SearchLoading) {
          return const ProductAllCardShimmer();
        }

        //  Success
        if (state is SearchSuccess) {
          final data = state.product.data;

          //  Products
          if (data.isNotEmpty) {
            return ProductAllCard(
              items: data,
              getImage: (prod) => prod.productImage,
              getTitle: (prod) => dataTranslation(
                prod.productNameArabic,
                prod.productNameEnglish,
              ),
              getPrice: (prod) => prod.productPriceFrom,
              onTap: (prod) {
                final productBloc = context.read<ProductBloc>();
                productBloc.add(LoadProductById(prod.productId));
                Get.toNamed(AppRoutes.productPage);
              },
            );
          }

          //  Empty State
          return Center(
            child: Empty(
              text1: 'There are currently no products'.tr,
              text2: '',
            ),
          );
        }

        //  Error
        if (state is SearchError) {
          return Center(
            child: Empty(
              text1: 'There are currently no products'.tr,
              text2: '',
            ),
          );
        }

        //  Fallback
        return const SizedBox.shrink();
      },
    );
  }
}

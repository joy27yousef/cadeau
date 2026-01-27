import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/empty.dart';
import 'package:cadeau/core/widgets/product_all_card.dart';
import 'package:cadeau/features/categories/screens/widgets/product_all_card_shimmer.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_bloc.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_state.dart';
import 'package:cadeau/features/product/logic/bloc/product_bloc.dart';
import 'package:cadeau/features/product/logic/bloc/product_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class MainOccasionPage extends StatelessWidget {
  const MainOccasionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final String? occasionNameArabic = args?['occasionNameArabic'];
    final String? occasionNameEnglish = args?['occasionNameEnglish'];

    return Scaffold(
      appBar: AppbarScreens(
        title: dataTranslation(occasionNameArabic, occasionNameEnglish),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<OccasionsBloc, OccasionsState>(
          builder: (context, state) {
            //  Loading
            if (state is OccasionsLoading) {
              return const ProductAllCardShimmer();
            }

            //  Success
            if (state is OccasionsByIdSuccess) {
              final data = state.occasions.data;

              //  Products
              if (data.products.isNotEmpty) {
                return ProductAllCard(
                  items: data.products,
                  getImage: (prod) => prod.productImage,
                  getTitle: (prod) => dataTranslation(
                    prod.productNameArabic,
                    prod.productNameEnglish,
                  ),
                  getPrice: (prod) => prod.productPrice,
                  onTap: (prod) {
                    final productBloc = context.read<ProductBloc>();
                    productBloc.add(LoadProductById(prod.productId));
                    Get.toNamed(AppRoutes.productPage);
                  },
                );
              }

              //  Empty State
              return Empty(
                text1: 'There are currently no products'.tr,
                text2: '',
              );
            }

            //  Error
            if (state is OccasionsError) {
              return Center(
                child: Text(
                  'Error: ${state.message}',
                  style: const TextStyle(color: Colors.red),
                ),
              );
            }

            //  Fallback
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

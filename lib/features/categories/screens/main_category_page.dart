import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/categories_all_page.dart';
import 'package:cadeau/core/widgets/product_all_card.dart';
import 'package:cadeau/features/categories/logic/bloc/categories_bloc.dart';
import 'package:cadeau/features/categories/logic/bloc/categories_state.dart';
import 'package:cadeau/features/categories/screens/widgets/product_all_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class MainCategoryPage extends StatelessWidget {
  const MainCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;
    final String? categoryNameArabic = args?['categoryNameArabic'];
    final String? categoryNameEnglish = args?['categoryNameEnglish'];

    return Scaffold(
      appBar: AppbarScreens(
        title: dataTranslation(categoryNameArabic, categoryNameEnglish),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            //  Loading
            if (state is CategoriesLoading) {
              return const ProductAllCardShimmer();
            }

            //  Success
            if (state is CategoryByIdSuccess) {
              final data = state.categories.data;
              final bloc = context.read<CategoriesBloc>();

              //  Subcategories
              if (data.subcategories.isNotEmpty) {
                return CategoriesAllpage(
                  items: data.subcategories,
                  getImage: (cat) => cat.categoryImage,
                  getTitle: (cat) => dataTranslation(
                    cat.categoryNameArabic,
                    cat.categoryNameEnglish,
                  ),
                  onTap: (sub) {
                    bloc.add(LoadCategoryById(sub.categoryId));

                    Get.toNamed(
                      AppRoutes.mainCategoryPage,
                      arguments: {
                        'categoryId': sub.categoryId,
                        'categoryNameArabic': sub.categoryNameArabic,
                        'categoryNameEnglish': sub.categoryNameEnglish,
                      },
                    );
                  },
                );
              }

              // 🛒 Products
              if (data.products.isNotEmpty) {
                return ProductAllCard(
                  items: data.products,
                  getImage: (prod) => prod.productImage,
                  getTitle: (prod) => dataTranslation(
                    prod.productNameArabic,
                    prod.productNameEnglish,
                  ),
                  getPrice: (prod) => prod.productPrice,
                  onTap: (prod) {},
                );
              }

              //  Empty State
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppImages.empty, height: 180),
                    const SizedBox(height: 10),
                    Text(
                      'There are currently no products'.tr,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: AppColor.darkGray,
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              );
            }

            //  Error
            if (state is CategoriesError) {
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

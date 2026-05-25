import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/services/service_locator.dart' show sl;
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/categories_all_page.dart';
import 'package:cadeau/core/widgets/empty.dart';
import 'package:cadeau/features/categories/logic/bloc/categories_bloc.dart';
import 'package:cadeau/features/categories/logic/bloc/categories_state.dart';
import 'package:cadeau/features/categories/screens/widgets/product_all_card_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'All Categories'.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocProvider(
          create: (_) => sl<CategoriesBloc>()..add(LoadCategories()),
          child: ListView(
            children: [
              SizedBox(height: 20),
              BlocBuilder<CategoriesBloc, CategoriesState>(
                builder: (context, state) {
                  //  Loading
                  if (state is CategoriesLoading) {
                    return const ProductAllCardShimmer();
                  }

                  //  Error
                  if (state is CategoriesError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  if (state is CategoriesSuccess) {
                    final categories = state.categories.data;
                    if (categories.isNotEmpty) {
                      return CategoriesAllpage(
                        items: categories,
                        getImage: (cat) => cat.categoryImage,
                        getTitle: (cat) => dataTranslation(
                          cat.categoryNameArabic,
                          cat.categoryNameEnglish,
                        ),
                        onTap: (cat) {
                          Get.toNamed(
                            AppRoutes.mainCategoryPage,
                            arguments: {
                              'categoryId': cat.categoryId,
                              'categoryNameArabic': cat.categoryNameArabic,
                              'categoryNameEnglish': cat.categoryNameEnglish,
                            },
                          );
                        },
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
            ],
          ),
        ),
      ),
    );
  }
}

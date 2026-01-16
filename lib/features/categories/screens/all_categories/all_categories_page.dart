import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/categories_all_page.dart';
import 'package:cadeau/features/categories/logic/bloc/categories_bloc.dart';
import 'package:cadeau/features/categories/logic/bloc/categories_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';

class AllCategoriesPage extends StatelessWidget {
  const AllCategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'All Categories'.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 20),
            BlocBuilder<CategoriesBloc, CategoriesState>(
              builder: (context, state) {
                final bloc = context.read<CategoriesBloc>();
                final cached = bloc.cachedCategories;

                if (cached == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                final categories = cached.data;

                return CategoriesAllpage(
                  items: categories,
                  getImage: (cat) => cat.categoryImage,
                  getTitle: (cat) => dataTranslation(
                    cat.categoryNameArabic,
                    cat.categoryNameEnglish,
                  ),
                  onTap: (cat) {
                    bloc.add(LoadCategoryById(cat.categoryId));

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
              },
            ),
          ],
        ),
      ),
    );
  }
}

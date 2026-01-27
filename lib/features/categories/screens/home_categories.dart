import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/title_home.dart';
import 'package:cadeau/features/categories/logic/bloc/categories_bloc.dart';
import 'package:cadeau/features/categories/logic/bloc/categories_state.dart';
import 'package:cadeau/features/home/widgets/home_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHome(
          text: 'Categories'.tr,
          viewAll: true,
          onTap: () {
            Get.toNamed(AppRoutes.allCategoriesPage);
          },
        ),
        SizedBox(height: 15),
        SizedBox(
          height: 100,
          child: BlocBuilder<CategoriesBloc, CategoriesState>(
            builder: (context, state) {
              final bloc = context.read<CategoriesBloc>();
              final cached = bloc.cachedCategories;

              if (cached == null) {
                return const HomeSkeleton();
              }

              final categories = cached.data.take(6).toList();
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, i) {
                  final category = categories[i];
                  return Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: InkWell(
                      onTap: () {
                        bloc.add(LoadCategoryById(category.categoryId));

                        Get.toNamed(
                          AppRoutes.mainCategoryPage,
                          arguments: {
                            'categoryId': category.categoryId,
                            'categoryNameArabic': category.categoryNameArabic,
                            'categoryNameEnglish': category.categoryNameEnglish,
                          },
                        );
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: Column(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: Center(
                              child: Image.network(
                                width: 45,
                                category.categoryImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            dataTranslation(
                              category.categoryNameArabic,
                              category.categoryNameEnglish,
                            ),
                            softWrap: true,
                            overflow: TextOverflow.fade,
                            style: Theme.of(context).textTheme.titleSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),

        SizedBox(height: 20),
      ],
    );
  }
}

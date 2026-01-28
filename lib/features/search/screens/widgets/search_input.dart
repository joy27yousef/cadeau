import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_bloc.dart';
import 'package:cadeau/features/brands/logic/bloc/brands_state.dart';
import 'package:cadeau/features/categories/logic/bloc/categories_bloc.dart';
import 'package:cadeau/features/categories/logic/bloc/categories_state.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_bloc.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_state.dart';
import 'package:cadeau/features/search/logic/bloc/search_bloc.dart';
import 'package:cadeau/features/search/logic/bloc/search_event.dart';
import 'package:cadeau/features/search/screens/widgets/show_filters.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          const SizedBox(width: 15),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Find your gift'.tr,
                hintStyle: TextStyle(color: Color(0xFF6B7280), fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              onTap: () {
                final categoriesState = context.read<CategoriesBloc>().state;
                final brandsState = context.read<BrandsBloc>().state;
                final occasionsState = context.read<OccasionsBloc>().state;

                final brandsList = (brandsState is BrandsSuccess)
                    ? brandsState.brand.data
                          .map(
                            (c) => {
                              'id': c.brandId.toString(),
                              'name': c.brandNameEnglish,
                            },
                          )
                          .toList()
                    : <Map<String, String>>[];

                final categoriesList = (categoriesState is CategoriesSuccess)
                    ? categoriesState.categories.data
                          .map(
                            (c) => {
                              'id': c.categoryId.toString(),
                              'name': c.categoryNameEnglish,
                            },
                          )
                          .toList()
                    : <Map<String, String>>[];

                final occasionsList = (occasionsState is OccasionsSuccess)
                    ? occasionsState.occasions.data
                          .map(
                            (o) => {
                              'id': o.occasionId.toString(),
                              'name': o.occasionNameEnglish,
                            },
                          )
                          .toList()
                    : <Map<String, String>>[];

                showFilters(
                  context: context,
                  categories: categoriesList,
                  brands: brandsList,
                  occasions: occasionsList,
                  onApply:
                      ({
                        String? categoryId,
                        String? occasionId,
                        String? brandId,
                        double? minPrice,
                        double? maxPrice,
                        String? color,
                        String? size,
                        String? storage,
                        String? name,
                      }) {
                        context.read<SearchBloc>().add(
                          FilterProducts(
                            categoryId: categoryId,
                            occasionId: occasionId,
                            brandId: brandId,
                            minPrice: minPrice?.toString(),
                            maxPrice: maxPrice?.toString(),
                            color: color,
                            size: size,
                            storage: storage,
                            name: name,
                          ),
                        );
                      },
                );
              },

              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: AppColor.mainColor,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Icon(
                  FontAwesomeIcons.filter,
                  color: Colors.white,
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

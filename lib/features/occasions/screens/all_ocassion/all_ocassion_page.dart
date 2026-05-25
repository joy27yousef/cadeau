import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/services/service_locator.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/categories_all_page.dart';
import 'package:cadeau/core/widgets/empty.dart';
import 'package:cadeau/features/categories/screens/widgets/product_all_card_shimmer.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_bloc.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_event.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class AllOcassionPage extends StatelessWidget {
  const AllOcassionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'All Ocassion'.tr),
      body: BlocProvider(
        create: (_) => sl<OccasionsBloc>()..add(LoadOccasions()),

        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: [
              SizedBox(height: 20),
              BlocBuilder<OccasionsBloc, OccasionsState>(
                builder: (context, state) {
                  //  Loading
                  if (state is OccasionsLoading) {
                    return const ProductAllCardShimmer();
                  }

                  // error
                  if (state is OccasionsError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: const TextStyle(color: Colors.red),
                        textAlign: TextAlign.center,
                      ),
                    );
                  }

                  if (state is OccasionsSuccess) {
                    final occasions = state.occasions.data;
                    if (occasions.isNotEmpty) {
                      return CategoriesAllpage(
                        items: occasions,
                        getImage: (occasions) => occasions.occasionImage,
                        getTitle: (occasions) => dataTranslation(
                          occasions.occasionNameArabic,
                          occasions.occasionNameEnglish,
                        ),
                        onTap: (occasions) {
                          Get.toNamed(
                            AppRoutes.mainOccasionPage,
                            arguments: {
                              'occasionId': occasions.occasionId,
                              'occasionNameArabic':
                                  occasions.occasionNameArabic,
                              'occasionNameEnglish':
                                  occasions.occasionNameEnglish,
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

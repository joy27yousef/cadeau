import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/appbar_screens.dart';
import 'package:cadeau/core/widgets/categories_all_page.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_bloc.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_event.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class AllOcassionPage extends StatelessWidget {
  const AllOcassionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarScreens(title: 'All Ocassion'.tr),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            SizedBox(height: 20),
            BlocBuilder<OccasionsBloc, OccasionsState>(
              builder: (context, state) {
                final bloc = context.read<OccasionsBloc>();
                final cached = bloc.cachedOccasions;

                if (cached == null) {
                  return const Center(child: CircularProgressIndicator());
                }

                final occasions = cached.data;

                return CategoriesAllpage(
                  items: occasions,
                  getImage: (occasions) => occasions.occasionImage,
                  getTitle: (occasions) => dataTranslation(
                    occasions.occasionNameArabic,
                    occasions.occasionNameEnglish,
                  ),
                  onTap: (occasions) {
                    bloc.add(LoadOccasionsById(occasions.occasionId));

                    Get.toNamed(
                      AppRoutes.mainOccasionPage,
                      arguments: {
                        'occasionId': occasions.occasionId,
                        'occasionNameArabic': occasions.occasionNameArabic,
                        'occasionNameEnglish': occasions.occasionNameEnglish,
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

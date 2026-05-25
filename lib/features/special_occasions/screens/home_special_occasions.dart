import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/empty.dart';
import 'package:cadeau/core/widgets/title_home.dart';
import 'package:cadeau/features/special_occasions/logic/bloc/special_occasions_bloc.dart';
import 'package:cadeau/features/special_occasions/logic/bloc/special_occasions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomeSpecialOccasions extends StatelessWidget {
  const HomeSpecialOccasions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        TitleHome(text: 'Special Occasions'.tr, viewAll: false),
        SizedBox(height: 15),
        BlocBuilder<SpecialOccasionsBloc, SpecialOccasionsState>(
          builder: (context, state) {
            //  Loading
            if (state is SpecialOccasionsLoading) {
              return SizedBox(
                height: 180,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 2,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 20,
                    ),
                    child: Container(
                      height: 160,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              );
            }

            // error
            if (state is SpecialOccasionsError) {
              return Center(
                child: Text(
                  state.message,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              );
            }

            if (state is SpecialOccasionsByIdSuccess) {
              final occasions = state.occasions.data;
              if (occasions.isNotEmpty) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: occasions.length,
                  itemBuilder: (context, i) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.mainOccasionPage,
                          arguments: {
                            'occasionId': occasions[i].occasionId,
                            'occasionNameArabic':
                                occasions[i].occasionNameArabic,
                            'occasionNameEnglish':
                                occasions[i].occasionNameEnglish,
                          },
                        );
                      },
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 160,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          image: DecorationImage(
                            image: NetworkImage(occasions[i].image),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
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
        SizedBox(height: 30),
      ],
    );
  }
}

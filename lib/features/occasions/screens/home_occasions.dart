import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/core/functions/data_translation.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/title_home.dart';
import 'package:cadeau/features/home/widgets/home_skeleton.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_bloc.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_event.dart';
import 'package:cadeau/features/occasions/logic/bloc/occasions_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HomeOccasions extends StatelessWidget {
  const HomeOccasions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHome(
          text: 'Occasions'.tr,
          viewAll: true,
          onTap: () {
            Get.toNamed(AppRoutes.allOcassionPage);
          },
        ),
        SizedBox(height: 15),

        SizedBox(
          height: 100,
          child: BlocBuilder<OccasionsBloc, OccasionsState>(
            builder: (context, state) {
              final bloc = context.read<OccasionsBloc>();
              final cached = bloc.cachedOccasions;

              if (cached == null) {
                return const HomeSkeleton();
              }

              final occasions = cached.data.take(6).toList();
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, i) {
                  final occasion = occasions[i];
                  return Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: InkWell(
                      onTap: () {
                        bloc.add(LoadOccasionsById(occasion.occasionId));

                        Get.toNamed(
                          AppRoutes.mainOccasionPage,
                          arguments: {
                            'occasionId': occasion.occasionId,
                            'occasionNameArabic': occasion.occasionNameArabic,
                            'occasionNameEnglish': occasion.occasionNameEnglish,
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
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Center(
                              child: Image.network(
                                occasion.occasionImage,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            dataTranslation(
                              occasion.occasionNameArabic,
                              occasion.occasionNameEnglish,
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
        TitleHome(
          text: 'Special Occasions'.tr,
          viewAll: true,
          onTap: () {
            Get.toNamed(AppRoutes.allOcassionPage);
          },
        ),
        SizedBox(height: 15),
        Container(
          height: 160,
          margin: const EdgeInsets.symmetric(horizontal: 20),

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.ads),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 10),

        Container(
          height: 160,
          margin: const EdgeInsets.symmetric(horizontal: 20),

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.ads),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 10),

        Container(
          height: 160,
          margin: const EdgeInsets.symmetric(horizontal: 20),

          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.ads),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

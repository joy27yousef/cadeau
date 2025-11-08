import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/view/widgets/boxText.dart';
import 'package:cadeau/view/widgets/title_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class HomeOnlyforu extends StatelessWidget {
  const HomeOnlyforu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleHome(text: '80'.tr),
        SizedBox(height: 15),
        Container(
          height: 130,
          child: Row(
            children: [
              Container(
                height: 124,
                width: 124,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(AppImages.ads),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 20),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Class Queen',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: AppColor.secondBlack,
                              ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          '\$12.50',
                          style: Theme.of(context).textTheme.titleLarge!
                              .copyWith(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                color: AppColor.mainColor,
                              ),
                        ),
                      ],
                    ),
                    Text(
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      'lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy...',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: AppColor.darkGray,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                      width: 120,
                      child: Boxtext(
                        color: AppColor.mainColor,
                        ontapfun: () {},
                        text: '81'.tr,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

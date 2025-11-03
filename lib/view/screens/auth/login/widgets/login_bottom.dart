import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/view/widgets/boxText.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class LoginBottom extends StatelessWidget {
  const LoginBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: () => Get.offNamed(AppRoutes.forgotpassword),
              borderRadius: BorderRadius.circular(20),
              child: Text(
                'Forgot Password ?',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: AppColor.mainColor,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Boxtext(
          color: AppColor.mainColor,
          ontapfun: () {
            Get.offAllNamed(AppRoutes.mainPage);
          },
          text: 'Log in',
        ),
        SizedBox(height: 18),
        Row(
          children: [
            Text(
              'Don’t have an account? ',
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColor.darkGray,
                fontWeight: FontWeight.w400,
              ),
            ),
            InkWell(
              onTap: () => Get.offNamed(AppRoutes.signup),
              borderRadius: BorderRadius.circular(20),
              child: Text(
                'Click here to sigup',

                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColor.mainColor,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  decorationColor: AppColor.mainColor,
                  decorationThickness: 2,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(width: 80, height: 1, color: AppColor.mainColor),
            Text(
              'OR LOG IN WITH',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: 14,
                color: AppColor.secondBlack,
                fontWeight: FontWeight.w300,
              ),
            ),
            Container(width: 80, height: 1, color: AppColor.mainColor),
          ],
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(AppImages.google, width: 15),
                  SizedBox(width: 5),
                  Text(
                    'Google',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColor.secondBlack,
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: Color(0xFFF9F9F9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    FontAwesomeIcons.facebookF,
                    color: Colors.blue,
                    size: 15,
                  ),
                  SizedBox(width: 5),

                  Text(
                    'Facebook',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: AppColor.secondBlack,
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/functions/message.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';
import 'package:cadeau/features/auth/signUp/logic/bloc/register_bloc.dart';
import 'package:cadeau/features/auth/signUp/logic/bloc/register_event.dart';
import 'package:cadeau/features/auth/signUp/logic/bloc/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SignupBottom extends StatelessWidget {
  const SignupBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocConsumer<RegisterBloc, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              showMessage(
                context,
                message: state.model.message,
                isSuccess: true,
              );
              Get.offAllNamed(AppRoutes.verificationOtpPage);
            } else if (state is RegisterFailure) {
              showMessage(
                context,
                message: state.error.message,
                isSuccess: false,
              );
            }
          },
          builder: (context, state) {
            final bloc = context.read<RegisterBloc>();
            bool isLoading = state is RegisterLoading;

            return BoxButtom(
              color: AppColor.mainColor,
              isLoading: isLoading,
              ontapfun: () {
                bloc.add(SubmitRegisterEvent());
              },
              text: 'Sign Up'.tr,
            );
          },
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Text(
              'Already have an account? '.tr,
              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: AppColor.darkGray,
                fontWeight: FontWeight.w400,
              ),
            ),
            InkWell(
              onTap: () => Get.offNamed(AppRoutes.login),
              borderRadius: BorderRadius.circular(20),
              child: Text(
                'Click here to login'.tr,
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
      ],
    );
  }
}

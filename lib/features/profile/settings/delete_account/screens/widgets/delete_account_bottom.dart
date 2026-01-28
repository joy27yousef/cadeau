import 'package:flutter/material.dart';
import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/constant/app_images.dart';
import 'package:cadeau/core/functions/confirmation_alert.dart';
import 'package:cadeau/core/functions/message.dart';
import 'package:cadeau/core/routes/app_routes.dart';
import 'package:cadeau/core/widgets/box_buttom.dart';
import 'package:cadeau/features/profile/settings/delete_account/logic/bloc/delete_account_bloc.dart';
import 'package:cadeau/features/profile/settings/delete_account/logic/bloc/delete_account_event.dart';
import 'package:cadeau/features/profile/settings/delete_account/logic/bloc/delete_account_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DeleteAccountBottom extends StatelessWidget {
  const DeleteAccountBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DeleteAccountBloc, DeleteAccountState>(
      listener: (context, state) {
        if (state is DeleteAccounSuccess) {
          showMessage(
            context,
            message: state.deleteAccountModel.message,
            isSuccess: true,
          );
          Get.offAllNamed(AppRoutes.login);
        } else if (state is DeleteAccounFailure) {
          showMessage(context, message: state.error.message, isSuccess: false);
        }
      },
      builder: (context, state) {
        final bloc = context.read<DeleteAccountBloc>();

        bool isLoading = state is DeleteAccounLoading;
        return BoxButtom(
          color: AppColor.mainColor,
          text: 'Delete Account'.tr,
          isLoading: isLoading,
          ontapfun: () {
            if (!bloc.formKey.currentState!.validate()) return;

            confirmationAelrt(
              AppImages.logout,
              'Are you sure you want to delete your account? You will not be able to login again.'
                  .tr,
              'No, Cancel'.tr,
              'Yes, Delete'.tr,
              AppColor.mainColor,
              isLoading,
              () {
                bloc.add(SubmitDeleteAccountEvent());
              },
            );
          },
        );
      },
    );
  }
}

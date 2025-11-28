import 'package:cadeau/core/constant/app_color.dart';
import 'package:cadeau/core/functions/message.dart';
import 'package:cadeau/core/functions/valid_inputs.dart';
import 'package:cadeau/core/widgets/TextFormGen.dart';
import 'package:cadeau/core/widgets/boxText.dart';
import 'package:cadeau/features/auth/signUp/logic/cubit/register_cubit.dart';
import 'package:cadeau/features/auth/signUp/logic/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SignupInputs extends StatelessWidget {
  const SignupInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          showMessage(message: state.model.message, isSuccess: true);
        } else if (state is RegisterFailure) {
          showMessage(message: state.error.message, isSuccess: false);
        }
      },
      builder: (context, state) {
        final cubit = context.read<RegisterCubit>();
        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name'.tr,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 8),
              TextFormGen(
                hint: '',
                lable: 'Enter full name'.tr,
                typekey: TextInputType.name,
                mycontroller: cubit.nameController,
                valid: (value) => ValidInputs.validateEmpty(value ?? ""),
              ),
              SizedBox(height: 15),

              Text(
                'Email Address'.tr,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 8),
              TextFormGen(
                hint: '',
                lable: 'email@gmail.com'.tr,
                typekey: TextInputType.emailAddress,
                mycontroller: cubit.emailController,
                valid: (value) =>
                    ValidInputs.validateEmail(value ?? "", email: value ?? ""),
              ),
              SizedBox(height: 15),

              Text(
                'Phone Number'.tr,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 8),
              TextFormGen(
                hint: '',
                lable: '+963'.tr,
                typekey: TextInputType.phone,
                mycontroller: cubit.phoneController,
                valid: (value) => ValidInputs.validatePhoneNumber(value),
              ),
              SizedBox(height: 15),

              Text(
                'Password'.tr,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 8),
              TextFormGen(
                hint: '',
                lable: '*******',
                typekey: TextInputType.text,
                mycontroller: cubit.passController,
                valid: (value) =>
                    ValidInputs.validatePassword(password: value ?? ""),
              ),
              SizedBox(height: 15),

              Text(
                'confirmation password'.tr,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 8),
              TextFormGen(
                hint: '',
                lable: '*******',
                typekey: TextInputType.text,
                mycontroller: cubit.confirmController,
                valid: (value) => ValidInputs.matchPassword(
                  value1: cubit.passController.text,
                  value2: value ?? "",
                  password: value ?? "",
                ),
              ),
              SizedBox(height: 20),

              Boxtext(
                color: AppColor.mainColor,
                ontapfun: () {
                  cubit.register();
                },
                text: state is RegisterLoading ? 'Loading...' : 'Sign Up'.tr,
              ),
            ],
          ),
        );
      },
    );
  }
}

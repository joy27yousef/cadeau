import 'package:cadeau/core/functions/valid_inputs.dart';
import 'package:cadeau/core/widgets/TextFormGen.dart';
import 'package:cadeau/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:cadeau/features/auth/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';

class LoginInputs extends StatelessWidget {
  const LoginInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();

        return Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Email Address'.tr,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 10),

              TextFormGen(
                hint: '',
                lable: 'email@gmail.com',
                typekey: TextInputType.emailAddress,
                mycontroller: cubit.emailController,
                valid: (value) =>
                    ValidInputs.validateEmail(value ?? "", email: value ?? ""),
              ),
              SizedBox(height: 20),
              Text(
                'Password'.tr,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 10),

              TextFormGen(
                hint: '',
                lable: '********',
                typekey: TextInputType.text,
                mycontroller: cubit.passController,
                valid: (value) =>
                    ValidInputs.validatePassword(password: value ?? ""),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}

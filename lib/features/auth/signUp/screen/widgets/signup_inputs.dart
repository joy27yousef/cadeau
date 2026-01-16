import 'package:cadeau/core/functions/valid_inputs.dart';
import 'package:cadeau/core/widgets/TextFormGen.dart';
import 'package:cadeau/features/auth/signUp/logic/bloc/register_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SignupInputs extends StatelessWidget {
  const SignupInputs({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegisterBloc>();

    return Form(
      key: bloc.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Full Name'.tr, style: Theme.of(context).textTheme.titleSmall),
          SizedBox(height: 8),
          TextFormGen(
            hint: '',
            lable: 'Enter full name'.tr,
            typekey: TextInputType.name,
            mycontroller: bloc.nameController,
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
            mycontroller: bloc.emailController,
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
            mycontroller: bloc.phoneController,
            valid: (value) => ValidInputs.validatePhoneNumber(value),
          ),
          SizedBox(height: 15),

          Text('Password'.tr, style: Theme.of(context).textTheme.titleSmall),
          SizedBox(height: 8),
          TextFormGen(
            hint: '',
            lable: '*******',
            typekey: TextInputType.text,
            mycontroller: bloc.passController,
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
            mycontroller: bloc.confirmController,
            valid: (value) => ValidInputs.matchPassword(
              value1: bloc.passController.text,
              value2: value ?? "",
              password: value ?? "",
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

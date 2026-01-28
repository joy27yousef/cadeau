import 'package:cadeau/core/functions/valid_inputs.dart';
import 'package:cadeau/core/widgets/TextFormGen.dart';
import 'package:cadeau/features/profile/settings/delete_account/logic/bloc/delete_account_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class DeleteAccountInputs extends StatelessWidget {
  const DeleteAccountInputs({super.key});

  @override
  Widget build(BuildContext context) {
    final bolc = context.read<DeleteAccountBloc>();

    return Form(
      key: bolc.formKey,
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
            mycontroller: bolc.emailController,
            valid: (value) =>
                ValidInputs.validateEmail(value ?? "", email: value ?? ""),
          ),

          SizedBox(height: 20),

          Text('Password'.tr, style: Theme.of(context).textTheme.titleSmall),

          SizedBox(height: 10),

          TextFormGen(
            hint: '',
            lable: '********',
            typekey: TextInputType.text,
            mycontroller: bolc.passController,
            valid: (value) =>
                ValidInputs.validatePassword(password: value ?? ""),
          ),

          SizedBox(height: 30),
        ],
      ),
    );
  }
}

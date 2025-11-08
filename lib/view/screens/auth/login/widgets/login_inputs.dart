import 'package:cadeau/view/widgets/TextFormGen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class LoginInputs extends StatelessWidget {
  const LoginInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('3'.tr, style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 10),

        TextFormGen(hint: '', lable: '11'.tr, typekey: TextInputType.phone),
        SizedBox(height: 20),
        Text('21'.tr, style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 10),

        TextFormGen(hint: '', lable: '********', typekey: TextInputType.phone),
        SizedBox(height: 10),
      ],
    );
  }
}

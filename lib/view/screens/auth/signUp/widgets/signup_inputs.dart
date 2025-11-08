import 'package:cadeau/view/widgets/TextFormGen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class SignupInputs extends StatelessWidget {
  const SignupInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('29'.tr, style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 10),
        TextFormGen(hint: '', lable: '30'.tr, typekey: TextInputType.name),
        SizedBox(height: 20),
        Text('4'.tr, style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 10),
        TextFormGen(
          hint: '',
          lable: '7'.tr,
          typekey: TextInputType.emailAddress,
        ),
        SizedBox(height: 20),
        Text('31'.tr, style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 10),
        TextFormGen(
          hint: '',
          lable: '7'.tr,
          typekey: TextInputType.emailAddress,
        ),
        SizedBox(height: 20),

        Text('3'.tr, style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 10),
        TextFormGen(hint: '', lable: '11'.tr, typekey: TextInputType.phone),
        SizedBox(height: 20),

        Text('21'.tr, style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 10),
        TextFormGen(hint: '', lable: '*******', typekey: TextInputType.text),
        SizedBox(height: 30),
      ],
    );
  }
}

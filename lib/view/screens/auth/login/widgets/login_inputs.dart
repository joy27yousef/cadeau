import 'package:cadeau/view/widgets/TextFormGen.dart';
import 'package:flutter/material.dart';

class LoginInputs extends StatelessWidget {
  const LoginInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Phone Number', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 10),

        TextFormGen(hint: '', lable: '+966', typekey: TextInputType.phone),
        SizedBox(height: 20),
        Text('Password', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 10),

        TextFormGen(hint: '', lable: '********', typekey: TextInputType.phone),
        SizedBox(height: 10),
      ],
    );
  }
}

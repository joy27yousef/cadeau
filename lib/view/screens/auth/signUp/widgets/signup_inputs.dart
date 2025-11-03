import 'package:cadeau/view/widgets/TextFormGen.dart';
import 'package:flutter/material.dart';

class SignupInputs extends StatelessWidget {
  const SignupInputs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Full Name', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 10),
        TextFormGen(
          hint: '',
          lable: 'Enter full name',
          typekey: TextInputType.name,
        ),
        SizedBox(height: 20),
        Text('Email Address', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 10),
        TextFormGen(
          hint: '',
          lable: 'email@gmail.com',
          typekey: TextInputType.emailAddress,
        ),
        SizedBox(height: 20),
        Text('Gender', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 10),
        TextFormGen(
          hint: '',
          lable: 'email@gmail.com',
          typekey: TextInputType.emailAddress,
        ),
        SizedBox(height: 20),

        Text('Phone Number', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 10),
        TextFormGen(hint: '', lable: '+966', typekey: TextInputType.phone),
        SizedBox(height: 20),

        Text('Password', style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 10),
        TextFormGen(hint: '', lable: '*******', typekey: TextInputType.text),
        SizedBox(height: 30),
      ],
    );
  }
}

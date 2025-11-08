import 'package:cadeau/view/widgets/TextFormGen.dart';
import 'package:flutter/material.dart';

class ReInputs extends StatelessWidget {
  final String text;
  final String lable;
  final TextInputType keyboard;
  final bool withSpace;
  const ReInputs({
    super.key,
    required this.text,
    required this.lable,
    required this.keyboard,
    this.withSpace = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: withSpace ? 35 : 20),
        Text(text, style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 5),

        TextFormGen(hint: '', lable: lable, typekey: keyboard),
        SizedBox(height: withSpace ? 15 : 0),
      ],
    );
  }
}

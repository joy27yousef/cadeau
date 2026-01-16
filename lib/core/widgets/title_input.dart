import 'package:cadeau/core/widgets/TextFormGen.dart';
import 'package:flutter/material.dart';

class TitleInput extends StatelessWidget {
  final String text;
  final String lable;
  final TextInputType keyboard;
  final bool withSpace;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  const TitleInput({
    super.key,
    required this.text,
    required this.lable,
    required this.keyboard,
    this.withSpace = true,
    this.valid,
    this.mycontroller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: withSpace ? 35 : 20),
        Text(text, style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 5),

        TextFormGen(
          hint: '',
          lable: lable,
          typekey: keyboard,
          valid: valid,
          mycontroller: mycontroller,
        ),
        SizedBox(height: withSpace ? 15 : 0),
      ],
    );
  }
}

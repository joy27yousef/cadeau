import 'package:cadeau/core/constant/app_color.dart';
import 'package:flutter/material.dart';

class TextFormGen extends StatelessWidget {
  final String hint;
  final String lable;
  final Icon? iconform;
  final bool? fillcolor;
  final TextInputType typekey;
  final bool isMessage;
  final TextEditingController? mycontroller;
  final String? Function(String?)? valid;
  final bool? obscureText;
  final void Function()? onTapicon;

  const TextFormGen({
    super.key,
    required this.hint,
    required this.lable,
    this.iconform,
    this.fillcolor,
    required this.typekey,
    this.isMessage = false,
    this.mycontroller,
    this.valid,
    this.obscureText,
    this.onTapicon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText == null || obscureText == false ? false : true,
      validator: valid,
      controller: mycontroller,
      keyboardType: typekey,
      cursorColor: AppColor.mainColor,
      minLines: isMessage ? 4 : 1,
      maxLines: isMessage ? 8 : 1,
      decoration: InputDecoration(
        filled: true,
        fillColor: fillcolor == null
            ? AppColor.background
            : Colors.grey.shade100,

        hintText: lable,
        hintStyle: TextStyle(
          color: Colors.grey.shade400,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),

        focusColor: AppColor.mainColor,

        suffixIcon: iconform != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: onTapicon,
                  child: iconform,
                ),
              )
            : null,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
            color: fillcolor == null
                ? Colors.grey.shade300
                : AppColor.background,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: AppColor.mainColor, width: 1),
        ),
      ),
    );
  }
}

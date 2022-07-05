import 'package:flutter/material.dart';

class ShareTextField extends StatelessWidget {
  const ShareTextField(
      {this.controller,
      this.isobscure = false,
      this.maxlength,
      required this.icon,
      this.sicon,
      required this.hintext,
      this.inputType = TextInputType.none,
      Key? key})
      : super(key: key);

  final TextEditingController? controller;
  final String hintext;
  final Widget icon;
  final Widget? sicon;
  final bool? isobscure;
  final int? maxlength;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxlength,
      obscureText: isobscure!,
      controller: controller,
      keyboardType: inputType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        counterText: "",
        suffixIcon: sicon,
        icon: icon,
        hintText: hintext,
      ),
    );
  }
}

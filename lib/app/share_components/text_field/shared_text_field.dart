import 'package:flutter/material.dart';

class ShareTextField extends StatelessWidget {
  const ShareTextField(
      {this.controller,
      required this.icon,
      required this.hintext,
      this.inputType = TextInputType.none,
      Key? key})
      : super(key: key);

  final TextEditingController? controller;
  final String hintext;
  final Widget icon;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: inputType,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        icon: icon,
        hintText: hintext,
      ),
    );
  }
}

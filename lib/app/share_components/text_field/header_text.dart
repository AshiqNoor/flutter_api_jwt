import 'package:flutter/material.dart';
import 'package:flutter_api_jwt/app/utils/helper/app_helper.dart';

class HeaderText extends StatelessWidget {
  const HeaderText(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: headerText);
  }
}

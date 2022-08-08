import 'package:flutter/material.dart';
import 'package:flutter_api_jwt/app/ui/ui_utils.dart';

import 'package:flutter_api_jwt/app/utils/helper/app_helper.dart';

class SharedAsyncButton extends StatelessWidget {
  const SharedAsyncButton(
      {required this.isLoading,
      required this.onPressed,
      required this.text,
      Key? key})
      : super(key: key);

  final bool isLoading;
  final Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return AsyncButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        primary: whiteCOLOR.withOpacity(0.3),
        minimumSize: const Size(double.maxFinite, 50),
        textStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.1,
        ),
      ),
      onPressed: onPressed,
      isLoading: isLoading,
      child: Text(
        text,
        style: buttonsText,
      ),
    );
  }
}

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_api_jwt/app/constants/app_constants.dart';
import 'package:flutter_api_jwt/app/share_components/text_field/header_text.dart';
import 'package:flutter_api_jwt/app/share_components/text_field/shared_button.dart';
import 'package:flutter_api_jwt/app/share_components/text_field/shared_text_button.dart';
import 'package:flutter_api_jwt/app/share_components/text_field/shared_text_field.dart';

part '../../provider/sign_in_provider.dart';
part '../../model/sign_in_model.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Image.asset(
                        ImagePath.background,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SafeArea(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ClipRRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.5,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white.withOpacity(0.2),
                                      Colors.white.withOpacity(0.2),
                                    ],
                                    begin: AlignmentDirectional.topStart,
                                    end: AlignmentDirectional.bottomEnd,
                                  ),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
                                  border: Border.all(
                                    width: 1.5,
                                    color: Colors.white.withOpacity(0.2),
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    children: [
                                      _buildTitle(),
                                      const SizedBox(height: 20),
                                      const ShareTextField(
                                        //controller: controller,
                                        hintext: 'Username',
                                        icon: Icon(Icons.person),
                                        inputType: TextInputType.name,
                                      ),
                                      const SizedBox(height: 10),
                                      const ShareTextField(
                                        //controller: controller,
                                        hintext: 'Password',
                                        icon: Icon(Icons.lock),
                                        inputType: TextInputType.name,
                                      ),
                                      const SizedBox(height: 10),
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: SharedTextButton(
                                          onPressed: () => {},
                                          text: 'Forgot Password',
                                        ),
                                      ),
                                      // const Expanded(
                                      //   child: Divider(
                                      //     endIndent: 16.0,
                                      //     thickness: 1,
                                      //   ),
                                      // ),
                                      const _Sign_in_button(),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Don't have an account?",
                                            style: Theme.of(context)
                                                .textTheme
                                                .caption
                                                ?.copyWith(fontSize: 14),
                                          ),
                                          SharedTextButton(
                                            onPressed: () => {},
                                            text: 'Sign Up',
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Sign_in_button extends StatelessWidget {
  const _Sign_in_button({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SharedButton(
      isLoading: false,
      onPressed: () => {},
      text: 'Sign In',
    );
  }
}

Widget _buildTitle() {
  return const Align(
    alignment: Alignment.topLeft,
    child: HeaderText("Sign In"),
  );
}

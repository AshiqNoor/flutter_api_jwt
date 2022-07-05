import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_api_jwt/app/config/routes/routing.dart';
import 'package:flutter_api_jwt/app/constants/app_constants.dart';
import 'package:flutter_api_jwt/app/share_components/text_field/header_text.dart';
import 'package:flutter_api_jwt/app/share_components/text_field/shared_text_button.dart';
import 'package:flutter_api_jwt/app/share_components/text_field/shared_text_field.dart';
import 'package:flutter_api_jwt/app/share_components/text_field/sharedasync_button.dart';

part '../../provider/sign_in_provider.dart';
part '../../model/sign_in_req_model.dart';
part "../../model/sign_in_res_model.dart";

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            ImagePath.background,
            fit: BoxFit.cover,
          ),
        ),
        SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.5,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.2),
                                  Colors.white.withOpacity(0.2),
                                ],
                                begin: AlignmentDirectional.topStart,
                                end: AlignmentDirectional.bottomEnd,
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
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
                                  _usernameField(),
                                  const SizedBox(height: 10),
                                  _passwordField(),
                                  const SizedBox(height: 10),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: SharedTextButton(
                                      onPressed: () => {},
                                      text: 'Forgot Password',
                                    ),
                                  ),
                                  SharedAsyncButton(
                                    isLoading: false,
                                    onPressed: () => {
                                      Pages.goToDashboard(),
                                    },
                                    text: 'Sign In',
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Don't have an account?",
                                        style: Theme.of(context)
                                            .textTheme
                                            .caption
                                            ?.copyWith(fontSize: 14),
                                      ),
                                      SharedTextButton(
                                        onPressed: () => {Pages.goToSignUp()},
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
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }

  ShareTextField _passwordField() {
    return const ShareTextField(
      //controller: controller,
      sicon: Icon(
        Icons.remove_red_eye_rounded,
      ),
      maxlength: 6,
      isobscure: true,
      hintext: 'Password',
      icon: Icon(Icons.lock),
      inputType: TextInputType.name,
    );
  }

  ShareTextField _usernameField() {
    return const ShareTextField(
      //controller: controller,
      hintext: 'Username',
      icon: Icon(Icons.person),
      inputType: TextInputType.name,
    );
  }
}

Widget _buildTitle() {
  return const Align(
    alignment: Alignment.topLeft,
    child: HeaderText("Sign In"),
  );
}

import 'dart:convert';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_jwt/app/config/routes/routing.dart';
import 'package:flutter_api_jwt/app/constants/app_constants.dart';
import 'package:flutter_api_jwt/app/share_components/text_field/header_text.dart';
import 'package:flutter_api_jwt/app/share_components/text_field/shared_text_button.dart';
import 'package:flutter_api_jwt/app/share_components/text_field/shared_text_field.dart';
import 'package:flutter_api_jwt/app/share_components/text_field/sharedasync_button.dart';
import 'package:flutter_api_jwt/app/utils/helper/app_helper.dart';

part '../../provider/sign_up_provider.dart';
part '../../views/component/term_condition_button.dart';
part '../../model/sign_up_req_model.dart';
part '../../model/sign_up_res_model.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

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
                              height:
                                  MediaQuery.of(context).size.height * 0.669,
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
                                    _emailField(),
                                    const SizedBox(height: 10),
                                    _passwordField(),
                                    const SizedBox(height: 10),
                                    _confirmPasswordField(),
                                    const SizedBox(height: 20),
                                    _TermConditionButton(
                                      onPressedPrivacyPolicy: () => {},
                                      onPressedTerms: () {},
                                    ),
                                    const SizedBox(height: 20),
                                    SharedAsyncButton(
                                      isLoading: false,
                                      onPressed: () => {},
                                      text: 'Continue',
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Already have a account?",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption
                                              ?.copyWith(fontSize: 14),
                                        ),
                                        SharedTextButton(
                                          onPressed: () => {Pages.goToSignIn()},
                                          text: 'Sign In',
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
                )),
          ),
        ),
        const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16.0 / 2),
            child: BackButton(
              color: whiteCOLOR,
            ),
          ),
        )
      ],
    ));
  }

  ShareTextField _confirmPasswordField() {
    return const ShareTextField(
      //controller: controller,
      sicon: Icon(
        Icons.remove_red_eye_rounded,
      ),
      maxlength: 6,
      isobscure: true,
      hintext: 'Confirm Password',
      icon: Icon(Icons.lock),
      inputType: TextInputType.name,
    );
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

  ShareTextField _emailField() {
    return const ShareTextField(
      //controller: controller,
      hintext: 'Email',
      icon: Icon(Icons.email),
      inputType: TextInputType.emailAddress,
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
    child: HeaderText("Sign Up"),
  );
}

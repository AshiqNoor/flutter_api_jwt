part of sign_up;

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
                                child: Consumer<SignUpProvide>(
                                    builder: (context, c, _) {
                                  return Column(
                                    children: [
                                      _buildTitle(),
                                      const SizedBox(height: 20),
                                      ShareTextField(
                                        controller: c.username,
                                        focusnode: c.usernameFocusNode,
                                        onSubmitted: (value) {
                                          FieldFocusNode.fieldFocusChange(
                                              context,
                                              c.usernameFocusNode,
                                              c.emailFocusNode);
                                        },
                                        hintext: 'Username',
                                        icon: const Icon(Icons.person),
                                        inputType: TextInputType.name,
                                      ),
                                      const SizedBox(height: 10),
                                      ShareTextField(
                                        controller: c.email,
                                        focusnode: c.emailFocusNode,
                                        onSubmitted: (value) {
                                          FieldFocusNode.fieldFocusChange(
                                              context,
                                              c.emailFocusNode,
                                              c.passwordFocusNode);
                                        },
                                        hintext: 'Email',
                                        icon: const Icon(Icons.email),
                                        inputType: TextInputType.emailAddress,
                                      ),
                                      const SizedBox(height: 10),
                                      ShareTextField(
                                        controller: c.password,
                                        focusnode: c.passwordFocusNode,
                                        sicon: InkWell(
                                          onTap: () {
                                            c.obsecure();
                                          },
                                          child: Icon(
                                            c.isObscure
                                                ? Icons.visibility_off_rounded
                                                : Icons.visibility,
                                          ),
                                        ),
                                        onSubmitted: (value) {
                                          FieldFocusNode.fieldFocusChange(
                                              context,
                                              c.passwordFocusNode,
                                              c.confirmpasswordFocusNode);
                                        },
                                        maxlength: 6,
                                        isobscure: c.isObscure,
                                        hintext: 'Password',
                                        icon: const Icon(Icons.lock),
                                        inputType: TextInputType.name,
                                      ),
                                      const SizedBox(height: 10),
                                      ShareTextField(
                                        controller: c.confirmpassword,
                                        focusnode: c.confirmpasswordFocusNode,
                                        sicon: InkWell(
                                          onTap: () {
                                            c.obsecure();
                                          },
                                          child: Icon(
                                            c.isObscure
                                                ? Icons.visibility_off_rounded
                                                : Icons.visibility,
                                          ),
                                        ),
                                        maxlength: 6,
                                        isobscure: c.isObscure,
                                        hintext: 'Confirm Password',
                                        icon: const Icon(Icons.lock),
                                        inputType: TextInputType.name,
                                      ),
                                      const SizedBox(height: 20),
                                      _TermConditionButton(
                                        onPressedPrivacyPolicy: () => {},
                                        onPressedTerms: () {},
                                      ),
                                      const SizedBox(height: 20),
                                      SharedAsyncButton(
                                        isLoading: c.isLoading,
                                        onPressed: () => {c.sigUp()},
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
                                            onPressed: () =>
                                                {Pages.goToSignIn()},
                                            text: 'Sign In',
                                          ),
                                        ],
                                      )
                                    ],
                                  );
                                }),
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
}

Widget _buildTitle() {
  return const Align(
    alignment: Alignment.topLeft,
    child: HeaderText("Sign Up"),
  );
}

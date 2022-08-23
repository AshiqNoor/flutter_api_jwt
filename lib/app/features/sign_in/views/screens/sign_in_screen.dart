part of sign_in;

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SignInProvide>(builder: (context, c, child) {
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
                                    ShareTextField(
                                      controller: c.username,
                                      autofocus: c.isAutoFocus,
                                      focusnode: c.usernameFocusNode,
                                      onSubmitted: (value) =>
                                          FieldFocusNode.fieldFocusChange(
                                              context,
                                              c.usernameFocusNode,
                                              c.passwordFocusNode),
                                      hintext: 'Username',
                                      icon: const Icon(Icons.person),
                                      inputType: TextInputType.name,
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
                                      maxlength: 6,
                                      isobscure: c.isObscure,
                                      hintext: 'Password',
                                      icon: const Icon(Icons.lock),
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
                                    SharedAsyncButton(
                                      isLoading: c.isLoading,
                                      onPressed: () => {
                                        c.signIn(),
                                      },
                                      text: 'Sign In',
                                    ),
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
    });
  }
}

Widget _buildTitle() {
  return const Align(
    alignment: Alignment.topLeft,
    child: HeaderText("Sign In"),
  );
}

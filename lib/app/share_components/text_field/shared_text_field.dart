part of shared_components;

class ShareTextField extends StatelessWidget {
  const ShareTextField(
      {this.controller,
      this.focusnode,
      this.onSubmitted,
      this.isobscure = false,
      this.autofocus = false,
      this.maxlength,
      required this.icon,
      this.sicon,
      required this.hintext,
      this.inputType = TextInputType.none,
      Key? key})
      : super(key: key);

  final TextEditingController? controller;
  final Function(String)? onSubmitted;
  final String hintext;
  final FocusNode? focusnode;
  final Widget icon;
  final Widget? sicon;
  final bool? isobscure;
  final bool? autofocus;
  final int? maxlength;
  final TextInputType? inputType;

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: autofocus!,
      onSubmitted: onSubmitted,
      focusNode: focusnode,
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

part of shared_components;

class SharedTextButton extends StatelessWidget {
  const SharedTextButton(
      {required this.onPressed, required this.text, Key? key})
      : super(key: key);

  final Function()? onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: linksText,
      ),
    );
  }
}

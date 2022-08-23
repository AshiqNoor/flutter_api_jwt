part of shared_components;

class HeaderText extends StatelessWidget {
  const HeaderText(this.text, {Key? key}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: headerText);
  }
}

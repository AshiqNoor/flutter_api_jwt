part of 'ui_utils.dart';

class AppSnackbar {
  static void showMessage(String msg) {
    final context = navigatorKey.currentState!.context;
    // if (context == null) return;

    final snackBar = SnackBar(
      content: Text(msg),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

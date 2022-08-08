part of '../views/screens/dashboard_screen.dart';

class DashboardProvider extends ChangeNotifier {
  bool isLoading = false;
  var message = "";
  var token = "";
  bool isActive = false;
  List<Pdata> data = [];

  // Future<void> userprofile() async {
  //   var logdata = await SharedService.loginDetails();
  //   if (logdata != null) {
  //     message = logdata.message;
  //     notifyListeners();
  //     token = logdata.data.token!;
  //     notifyListeners();
  //   } else {
  //     message = "";
  //     notifyListeners();
  //     token = "";
  //     notifyListeners();
  //   }
  // }

  Future<void> getuserprofile() async {
    isLoading = true;
    notifyListeners();

    var list = await RestApi.userprofile();

    if (list != null) {
      //print(list.message);
      token = list.authorization;
      notifyListeners();

      data = list.data;
      notifyListeners();

      isLoading = false;
      notifyListeners();
    } else {
      AppSnackbar.showMessage("Session Expired");
      Pages.goToSignIn();

      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    try {
      isLoading = true;
      notifyListeners();
      //await Future.delayed(const Duration(milliseconds: 700));
      await SharedService.logOut();
      isLoading = false;
      notifyListeners();
      Pages.goToSignIn();
    } catch (_) {}
  }
}

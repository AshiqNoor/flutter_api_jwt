part of dashboard;

class DashboardProvider extends BaseProvider {
  var message = "";
  var token = "";
  List<Pdata> data = [];

  Future<void> getuserprofile() async {
    isLoading = true;
    notifyListeners();

    UserProfileResModel response = await DashboardRepo().fetchData();

    if (response.message == "Success") {
      token = response.message;
      notifyListeners();

      data = response.data;
      notifyListeners();

      isLoading = false;
      notifyListeners();
    } else if (response.message == "Session Expire") {
      AppSnackbar.showMessage(response.message);
      //Pages.goToSignIn();
      signOut();
      isLoading = false;
      notifyListeners();
    } else {
      AppSnackbar.showMessage(response.message);
      isLoading = false;
      notifyListeners();
    }
  }
}

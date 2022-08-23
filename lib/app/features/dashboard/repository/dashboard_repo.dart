part of dashboard;

abstract class DashboardRepository {
  Future<UserProfileResModel> fetchData();
}

class DashboardRepo extends DashboardRepository {
  @override
  Future<UserProfileResModel> fetchData() async {
    var token = await SharedService.loginDetails();

    Map<String, String> reqheaders = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${token!.data.token}"
    };
    final response = await BaseClient().get(ApiPath.profile, reqheaders);
    return userProfileResModelFromJson(response);
  }
}

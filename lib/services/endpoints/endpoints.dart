class ProjectApis {
  // static String baseUrl = "https://elibrari.herokuapp.com/";
  static String baseUrl = "http://192.168.1.102:8000/";

  String loginUrl = "${baseUrl}api/auth/login";
  String registerUrl = "${baseUrl}api/auth/register";
  String logoutUrl = "${baseUrl}api/auth/logout";
  String resetPasswordUrl = "${baseUrl}api/auth/forgot-password";

  String streamsUrl = "${baseUrl}api/streams";
  // static String streamsLocalUrl = "${baseUrl}api/streams";
  // static String streamsSearchUrl = "${baseUrl}api/streams/search";

  String departmentsUrl = "${baseUrl}api/departments";

  static String requestUrl = "${baseUrl}api/requests";

  String userUrl = "${baseUrl}api/user";

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };

  // Error messages
  final String errorMessage = "Something went wrong";
  final String errorMessageNoInternet = "No internet connection";
  final String errorMessageNoData = "No data found";
  final String errorMessageUnauthorized = "Unauthorized";
  final String errorMessageServer = "Server error";
}

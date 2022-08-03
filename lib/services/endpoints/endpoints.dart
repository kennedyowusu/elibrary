class ProjectApis {
  static String baseUrl = "https://elibrari.herokuapp.com/";
  static String localBaseUrl = "0.0.0.0:8000/";

  String loginUrl = "${baseUrl}api/auth/login";
  String registerUrl = "${baseUrl}api/auth/register";
  String logoutUrl = "${baseUrl}api/auth/logout";

  static String streamsUrl = "${baseUrl}api/streams";

  Map<String, String> headers = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
}

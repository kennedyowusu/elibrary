import 'package:elibrary/model/authentication.dart';
import 'package:elibrary/services/endpoints.dart';
import 'package:elibrary/services/requests.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationRepository {
  final ApiClient apiClient = ApiClient();
  // final Future<SharedPreferences> sharedPreferences =
  //     SharedPreferences.getInstance();

  late final SharedPreferences sharedPreferences;

  Future<Response> registration(AuthModel authModel) async {
    return await apiClient.postRequest(
      ProjectConstants.REGISTER_URI,
      authModel.toJson(),
    );
  }

// Update the token in the shared preferences upon successful registration
  saveUserTokenAfterRegistration(
    String token,
  ) async {
    apiClient.token = token;
    apiClient.updateHeaders(token);
    return await sharedPreferences.setString(ProjectConstants.TOKEN, token);
  }
}

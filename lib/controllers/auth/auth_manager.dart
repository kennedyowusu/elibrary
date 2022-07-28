import 'package:elibrary/controllers/cache/cache_manager.dart';
import 'package:get/get.dart';

class AuthenticationManager extends GetxController with CacheManager {
  final isLogged = false.obs;

  void logOut() {
    isLogged.value = false;
    removeToken();
  }

  void login(String? token) async {
    isLogged.value = true;
    //Token is cached
    await saveToken(token);
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }
}

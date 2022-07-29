// import 'package:elibrary/controllers/auth/auth_manager.dart';
// import 'package:elibrary/services/project_service.dart';
// import 'package:elibrary/views/auth/login/components/login_request.dart';
// import 'package:elibrary/views/auth/register/component/register_request.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LoginViewModel extends GetxController {
//   late final ProjectService _projectService;
//   late final AuthenticationManager _authManager;

//   @override
//   void onInit() {
//     super.onInit();
//     _projectService = Get.put(ProjectService());
//     _authManager = Get.find();
//   }

//   Future<void> loginUser(String email, String password) async {
//     final response = await _projectService
//         .fetchLogin(LoginRequestModel(email: email, password: password));

//     if (response != null) {
//       /// Set isLogin to true
//       _authManager.login(response.token);
//     } else {
//       /// Show user a dialog about the error response
//       Get.defaultDialog(
//           middleText: 'User not found!',
//           textConfirm: 'OK',
//           confirmTextColor: Colors.white,
//           onConfirm: () {
//             Get.back();
//           });
//     }
//   }

//   Future<void> registerUser(String email, String password) async {
//     final response = await _projectService
//         .fetchRegister(RegisterRequestModel(email: email, password: password));

//     if (response != null) {
//       /// Set isLogin to true
//       _authManager.login(response.token);
//     } else {
//       /// Show user a dialog about the error response
//       Get.defaultDialog(
//           middleText: 'Register Error',
//           textConfirm: 'OK',
//           confirmTextColor: Colors.white,
//           onConfirm: () {
//             Get.back();
//           });
//     }
//   }
// }

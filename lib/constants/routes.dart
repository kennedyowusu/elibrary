import 'package:elibrary/views/auth/login/login.dart';
import 'package:elibrary/views/auth/register/register.dart';
import 'package:elibrary/views/department/departments.dart';
import 'package:elibrary/views/home/home.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String home = HomeView.routeName;
}

final Map<String, WidgetBuilder> routes = {
  Routes.home: (context) {
    return HomeView();
  },
  '/login': (context) => LoginScreen(),
  '/register': (context) => RegisterScreen(),
  '/departments': (context) => AllDepartmentsView(),
};

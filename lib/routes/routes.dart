import 'package:elibrary/views/auth/login/login.dart';
import 'package:elibrary/views/auth/register/register.dart';
import 'package:elibrary/views/borrowed_books/borrowed_books.dart';
import 'package:elibrary/views/category/category_content.dart';
import 'package:elibrary/views/details/details.dart';
import 'package:elibrary/views/home/home.dart';
import 'package:elibrary/views/profile/profile.dart';
import 'package:elibrary/views/request/request.dart';
import 'package:elibrary/views/saved_books/saved_books.dart';
import 'package:elibrary/views/splash/splash.dart';
import 'package:get/get.dart';

class RouteHelper {
  static const String splashScreen = '/splash-screen';
  static const String home = '/';
  static const String details = '/details';
  static const String request = '/request';
  static const String savedBooks = '/saved-books';
  static const String borrowedBooks = '/borrowed-books';
  static const String profile = '/profile';
  static const String category = '/category-content';

  static const String loginScreen = '/login-screen';
  static const String registerScreen = '/register-screen';

  static getSplashScreen() => splashScreen;
  static getInitialRoute() => home;
  static getDetailRoute() => details;
  static getRequestBookRoute() => request;
  static getSavedBooks() => savedBooks;
  static getBorrowedBooks() => borrowedBooks;
  static getProfile() => profile;
  static getCategoryContent() => category;

  static getLoginScreen() => loginScreen;
  static getRegisterScreen() => registerScreen;

  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () => SplashView(),
    ),
    GetPage(
      name: home,
      page: () => HomeView(),
    ),
    GetPage(
      name: details,
      page: () => DetailScreen(),
    ),
    GetPage(
      name: request,
      page: () {
        return RequestBookView();
      },
    ),
    GetPage(
      name: savedBooks,
      page: () => SavedBooksView(),
    ),
    GetPage(
      name: borrowedBooks,
      page: () => BorrowedBooksView(),
    ),
    GetPage(
      name: profile,
      page: () => ProfileScreen(),
    ),
    GetPage(
      name: category,
      page: () => CategoryContentScreen(),
    ),
    GetPage(
      name: loginScreen,
      page: () {
        return LoginView();
      },
    ),
    GetPage(
      name: registerScreen,
      page: () {
        return RegisterView();
      },
    ),
  ];
}

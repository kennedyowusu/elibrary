import 'package:elibrary/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(Elibrary());
}

class Elibrary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Library',
      defaultTransition: Transition.rightToLeft,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: Colors.white,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'Poppins',
            ),
      ),
      initialRoute: RouteHelper.getSplashScreen(),
      getPages: RouteHelper.routes,
    );
  }
}

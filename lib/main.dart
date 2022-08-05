import 'package:elibrary/constants/colors.dart';
import 'package:elibrary/constants/routes.dart';
import 'package:elibrary/model/user.dart';
import 'package:elibrary/utils/shared_prefs.dart';
import 'package:elibrary/views/auth/login/login.dart';
import 'package:elibrary/views/onboard/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
bool? seenOnboard;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  seenOnboard = await preferences.getBool("seenOnboard") ?? false;

  runApp(Elibrary());
}

class Elibrary extends StatefulWidget {
  @override
  State<Elibrary> createState() => _ElibraryState();
}

class _ElibraryState extends State<Elibrary> {
  // This widget is the root of your application.
  late final Widget myFuture;

  getData() {
    return FutureBuilder(
      future: UserPreferences().getUser(),
      builder: (context, AsyncSnapshot<User?> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(
                color: ProjectColors.primary,
              ),
            );
          default:
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.data == null) {
              return LoginScreen();
            } else {
              return CircularProgressIndicator(
                color: ProjectColors.primary,
              );
            }
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    myFuture = getData();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? widget) {
        return ResponsiveSizer(
          builder: (_, __, ___) => GetMaterialApp(
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
            home: seenOnboard == true ? myFuture : OnboardView(),
            routes: routes,
          ),
        );
      },
    );
  }
}

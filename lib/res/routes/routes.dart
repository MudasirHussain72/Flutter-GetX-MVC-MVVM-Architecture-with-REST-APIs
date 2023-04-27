import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view/home/home_screen.dart';
import 'package:getx_mvvm/view/login/login_screen.dart';
import 'package:getx_mvvm/view/splash/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
            name: RouteName.splashScreen,
            page: () => SplashScreen(),
            transition: Transition.cupertino,
            transitionDuration: Duration(milliseconds: 260)),
        GetPage(
            name: RouteName.loginScreen,
            page: () => LoginScreen(),
            transition: Transition.cupertino,
            transitionDuration: Duration(milliseconds: 260)),
        GetPage(
            name: RouteName.homeScreen,
            page: () => HomeScreen(),
            transition: Transition.cupertino,
            transitionDuration: Duration(milliseconds: 260)),
      ];
}

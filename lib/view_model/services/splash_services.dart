import 'dart:async';

import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/view_model/controller/user_preference/user_preference_view_model.dart';

class SplashServices {
  UserPreference userPreference = UserPreference();
  void isLogin() {
    userPreference.getUser().then((value) {
      print(value.token);
      print(value.isLogin);
      if (value.isLogin == true || value.isLogin != null) {
        Timer(Duration(seconds: 3), () {
          Get.toNamed(RouteName.homeScreen);
        });
      } else {
        Timer(Duration(seconds: 3), () {
          Get.toNamed(RouteName.loginScreen);
        });
      }
    });
  }
}

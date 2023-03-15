import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_architecture_flutter/model/user_model.dart';
import 'package:mvvm_architecture_flutter/utils/routes/routes_name.dart';
import 'package:mvvm_architecture_flutter/view_model/user_view_model.dart';

class SplashServices {
  checkAuthentication(BuildContext context) async {
    getUserData().then((value) async {
      if (value.token == 'null' || value.token == '') {
        await Future.delayed(const Duration(seconds: 4));
        Navigator.pushReplacementNamed(context, RoutesName.login);
      } else {
        await Future.delayed(const Duration(seconds: 4));
        Navigator.pushReplacementNamed(context, RoutesName.home);
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print("Error: $error");
      }
    });
  }

  Future<UserModel> getUserData() => UserViewModel().getUser();
}

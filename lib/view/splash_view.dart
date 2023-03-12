import 'package:flutter/material.dart';
import 'package:mvvm_architecture_flutter/res/app_colors.dart';
import 'package:mvvm_architecture_flutter/res/components/round_button.dart';
import 'package:mvvm_architecture_flutter/utils/routes/routes_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(
              title: "Log In",
              onPress: () => Navigator.pushNamed(context, RoutesName.login),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            RoundButton(
              title: "Sign Up",
              onPress: () => Navigator.pushNamed(context, RoutesName.signup),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bmi1/Screens/LoginScreen.dart';
import 'package:bmi1/Services/Router.dart';
import 'package:flutter/material.dart';

class SplachScreen extends StatelessWidget {
  SplachScreen();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) =>
        AppRouter.appRouter.goReplacement(LoginScreen()));
      return SafeArea(
      child: Image.asset(
      'assets/images/sp.png',
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
    ));
  }
}

import 'package:bmi1/Authintication/UI/LoginScreen.dart';
import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Services/Router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplachScreen extends StatelessWidget {
  static final routeName='splach';
  SplachScreen();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 2)).then((value) =>
       Provider.of<AuthProvider>(context,listen: false).checkLogin());
      return SafeArea(
      child: Image.asset(
      'assets/images/sp.png',
      fit: BoxFit.fill,
      height: double.infinity,
      width: double.infinity,
    ));
  }
}

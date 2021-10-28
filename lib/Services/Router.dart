import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRouter{
  AppRouter._();
  static AppRouter appRouter =AppRouter._();
  GlobalKey<NavigatorState> navkey = GlobalKey<NavigatorState>();

  gotoPagewithReplacment(String routeName){
    navkey.currentState.pushReplacementNamed(routeName);
  }
  goReplacement(Widget widget){
    navkey.currentState.pushReplacement(MaterialPageRoute(builder: (x)=>widget));
  }
  back(){
    navkey.currentState.pop();
  }
}
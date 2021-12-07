import 'package:bmi1/Authintication/UI/LoginScreen.dart';
import 'package:bmi1/Authintication/UI/RegisterScreen.dart';
import 'package:bmi1/Screens/CompleteScreen.dart';
import 'package:bmi1/Screens/FoodList.dart';
import 'package:bmi1/Screens/MainScreen.dart';
import 'package:bmi1/Screens/NewFood.dart';
import 'package:bmi1/Screens/NewRecord.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'AppFire.dart';
import 'Provider/AuthProvider.dart';
import 'Screens/SplachScreen.dart';
import 'Screens/ُEditFood.dart';
import 'Services/Router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
      child: MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
          maxWidth: 360,
          maxHeight: 690,
        ),
        designSize: Size(360, 690),
        orientation: Orientation.portrait);
    return MaterialApp(
      navigatorKey: AppRouter.appRouter.navkey,
      debugShowCheckedModeBanner: false,
      routes: {
        SplachScreen.routeName: (_) => SplachScreen(),
        CompleteScreen.routeName: (_) => CompleteScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        MainScreen.routeName: (_) => MainScreen(),
        NewRecord.routeName: (_) => NewRecord(),
        NewFood.routeName: (_) => NewFood(),
        EditFoof.routeName: (_) => EditFoof(),
        FoodList.routeName: (_) => FoodList(),
      },
      home: App(),
    );
  }
}


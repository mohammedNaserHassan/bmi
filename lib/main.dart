import 'package:bmi1/Authintication/UI/LoginScreen.dart';
import 'package:bmi1/Authintication/UI/RegisterScreen.dart';
import 'package:bmi1/Screens/CompleteScreen.dart';
import 'package:bmi1/Screens/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'AppFire.dart';
import 'Provider/AuthProvider.dart';
import 'Screens/SplachScreen.dart';
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
    return MaterialApp(
      navigatorKey: AppRouter.appRouter.navkey,
      debugShowCheckedModeBanner: false,
      routes: {
        SplachScreen.routeName: (_) => SplachScreen(),
        CompleteScreen.routeName: (_) => CompleteScreen(),
        LoginScreen.routeName: (_) => LoginScreen(),
        RegisterScreen.routeName: (_) => RegisterScreen(),
        MainScreen.routeName: (_) => MainScreen(),
      },
      home: App(),
    );
  }
}


import 'package:bmi1/Provider/MyProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/SplachScreen.dart';
import 'Services/Router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider<MyProvider>(
    create: (context) => MyProvider(),
    child: MyApp(),
  ),);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: AppRouter.appRouter.navkey,
      debugShowCheckedModeBanner: false,
      home: SplachScreen(),
    );
  }
}


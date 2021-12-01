import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Screens/FoodList.dart';
import 'package:bmi1/Screens/NewRecord.dart';
import 'package:bmi1/Services/Router.dart';
import 'package:bmi1/Widgets/Buttons/CustomClick.dart';
import 'package:bmi1/Widgets/Rows/CustomRow.dart';
import 'package:bmi1/Widgets/Buttons/MyButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'NewFood.dart';

class MainScreen extends StatefulWidget {
  static final routeName = 'mainScreen';

  const MainScreen();

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.blue,
          width: 5,
        )),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            elevation: 0,
            title: Text('BMI Analyzer'),
            centerTitle: true,
          ),
          body: Consumer<AuthProvider>(
            builder: (context, provider, v) => provider.user==null?Center(
              child: CircularProgressIndicator(),
            ):SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      'Hi,' + '' + provider.user.name??'',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30),
                    child: Text(
                      'Current Status',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    height: 50,
                    width: 380,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                        child: Text(
                      'Normal (still Good)',
                      style: TextStyle(color: Colors.grey),
                    )),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, top: 20, bottom: 10),
                    child: Text(
                      'Old Status',
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 25, right: 25, top: 20),
                    height: 330,
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          CustomRow(),
                          SizedBox(
                            height: 10,
                          ),
                          CustomRow(),
                          SizedBox(
                            height: 10,
                          ),
                          CustomRow(),
                          SizedBox(
                            height: 10,
                          ),
                          CustomRow(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 25),
                    child: Row(
                      children: [
                        CustomClick(
                          label: 'Add Food',
                          function: (){
                            AppRouter.appRouter.gotoPage(NewFood.routeName);
                          },
                        ),
                        CustomClick(
                          function: (){
                            AppRouter.appRouter.gotoPage(NewRecord.routeName);
                          },
                          label: 'Add Record',
                        ),
                      ],
                    ),
                  ),
                  MyButton(
                    function: (){
                      provider.getFoods();
                      AppRouter.appRouter.gotoPage(FoodList.routeName);
                    },
                    label: 'View Food',
                    margin: 15,
                  ),
                  Center(
                      child: TextButton(
                          onPressed: () {
                            provider.logOut();
                          },
                          child: Text(
                            'Logout',
                            style: TextStyle(
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ))),
                ],
              ),
            ),
          ),
        ));
  }
}

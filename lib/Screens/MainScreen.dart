import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Screens/FoodList.dart';
import 'package:bmi1/Screens/NewMeal.dart';
import 'package:bmi1/Screens/NewRecord.dart';
import 'package:bmi1/Services/Router.dart';
import 'package:bmi1/Widgets/Buttons/CustomClick.dart';
import 'package:bmi1/Widgets/Rows/CustomRow.dart';
import 'package:bmi1/Widgets/Buttons/MyButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          color: Color(0xff0B85D8),
          width: 5.w,
        )),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff0B85D8),
            elevation: 0,
            title: Text('BMI Analyzer'),
            centerTitle: true,
          ),
          body: Consumer<AuthProvider>(
            builder: (context, provider, v) => provider.user == null
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.h,
                        ),
                        Center(
                          child: Text(
                            'Hi,' + '' + provider.user.name ?? '',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 30.sp),
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30.w),
                          child: Text(
                            'Current Status',
                            style: TextStyle(
                                color: Color(0xff0B85D8),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10.h, horizontal: 30.w),
                          height: 50.h,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0xff0B85D8)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                              child: Text(
                            provider.lastStatus+'('+provider.differenceBI+')' ,
                            style: TextStyle(color: Colors.grey),
                          )),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              left: 30.w, top: 20.h, bottom: 10.h),
                          child: Text(
                            'Old Status',
                            style: TextStyle(
                                color: Color(0xff0B85D8),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(
                              left: 25.w, right: 25.w, top: 20.h),
                          height: 350,
                          margin: EdgeInsets.symmetric(horizontal: 30.w),
                          decoration: BoxDecoration(
                            color: Color(0xff0B85D8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: provider.myRecords == null
                              ? Center(
                                  child: LinearProgressIndicator(),
                                )
                              : SingleChildScrollView(
                                  child: SizedBox(
                                  height: 320.h,
                                  child: ListView.builder(
                                    itemCount: provider.myRecords.length,
                                    itemBuilder: (context, index) => CustomRow(
                                        weight: provider.myRecords[index].weight,
                                        length: provider.myRecords[index].length,
                                        date: provider.myRecords[index].date,
                                        state: provider.setBMI(bmi: provider.getBMI(
                                         weight: double.parse(provider.myRecords[index].weight),
                                         ageParcent: provider.getAgePercent(
                                          gender: provider.user.gender,
                                         age: provider.user.dateOfBirth
                                         ),
                                         length: double.parse(provider.myRecords[index].length)
                                        )
                                        ),),
                                  ),
                                )),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 25.h),
                          child: Row(
                            children: [
                              CustomClick(
                                label: 'Add Food',
                                function: () {
                                  AppRouter.appRouter
                                      .gotoPage(NewFood.routeName);
                                },
                              ),
                              CustomClick(
                                function: () {
                                  AppRouter.appRouter
                                      .gotoPage(NewRecord.routeName);
                                },
                                label: 'Add Record',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: CustomClick(
                            label: 'Add Meal',
                            function: () {
                              AppRouter.appRouter.gotoPagewithReplacment(NewMeal.routeName);
                            },
                          ),
                        ),
                        MyButton(
                          function: () {
                            AppRouter.appRouter
                                .gotoPagewithReplacment(FoodList.routeName);
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

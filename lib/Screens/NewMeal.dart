import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Screens/MainScreen.dart';
import 'package:bmi1/Services/Router.dart';
import 'package:bmi1/Widgets/Buttons/CustomClick.dart';
import 'package:bmi1/Widgets/Rows/DateTimeWidget.dart';
import 'package:bmi1/Widgets/Rows/WeightRow.dart';
import 'package:bmi1/Widgets/DropDownButton/dropRow.dart';
import 'package:bmi1/Widgets/Text/MainText.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewMeal extends StatelessWidget {
  static final routeName = 'newMeal';

  NewMeal();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, v) => Container(
          decoration: BoxDecoration(
              border: Border.all(
            color: Color(0xff0B85D8),
            width: 5.w,
          )),
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: (){
                    AppRouter.appRouter.gotoPagewithReplacment(MainScreen.routeName);
                    provider.clearController();
                  },
                  icon: Icon(Icons.arrow_back,color: Colors.white,
                  )),
              backgroundColor: Color(0xff0B85D8),
              elevation: 0,
              title: Text('BMI Analyzer'),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                      child: MainText(
                    txt: 'Add Meal Details',
                  )),
                  SizedBox(
                    height: 120.h,
                  ),
                  dropRow(
                    stateDrop: false,
                    size: 100.w,
                    title: 'Food',
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  WeightRow(
                    width: 125.0.w,
                    sizebox: 25,
                    title: 'Amount',
                    found: false,
                    unit: 'unit',
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  DateTimeWidget(
                    inputType: TextInputType.datetime,
                    label: 'Date',
                    space: 100.w,
                    textEditingController: provider.date,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  DateTimeWidget(
                    inputType: TextInputType.datetime,
                    label: 'Time',
                    space: 95.w,
                    textEditingController: provider.time,
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 20.w),
                        width: 150.w,
                        height: 60.h,
                        child: CustomClick(
                          label: 'Reset',
                          function: () {
                            provider.clearController();
                            provider.setValueNames(null);
                          },
                        ),
                      ),
                      Container(
                        width: 130.w,
                        height: 60.h,
                        child: CustomClick(
                          label: 'Save',
                          function: () {
                            if (provider.date.text.length != 0 &&
                                provider.weight.text.length != 0 &&
                                provider.valueNames.length != 0 &&
                                provider.time.text.length != 0) {
                              provider.addNewMeal();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text("Successfully Added The Meal"),
                              ));
                            } else {
                              provider.clearController();
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    Text("Please... Add info about your meal"),
                              ));
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}

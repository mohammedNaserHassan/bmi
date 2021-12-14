import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Screens/MainScreen.dart';
import 'package:bmi1/Services/Router.dart';
import 'package:bmi1/Widgets/Rows/DateTimeWidget.dart';
import 'package:bmi1/Widgets/Rows/LengthRow.dart';
import 'package:bmi1/Widgets/Rows/WeightRow.dart';
import 'package:bmi1/Widgets/Text/MainText.dart';
import 'package:bmi1/Widgets/Buttons/MyButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewRecord extends StatelessWidget {
  static final routeName = 'newRecord';

  NewRecord();

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
                    txt: 'New Record',
                  )),
                  SizedBox(
                    height: 120.h,
                  ),
                  WeightRow(
                    sizebox: 30.w,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  LengthRow(
                    sizbox: 30.w,
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
                  Container(
                      width: 400.w,
                      child: MyButton(
                        label: 'Save Data',
                        function: () {
                          if (provider.length.text.length != 0 &&
                              provider.weight.text.length != 0 &&
                              provider.date.text.length != 0 &&
                              provider.time.text.length != 0) {
                            provider.addNewRecord();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text("Successfully Added The Record"),
                            ));
                            AppRouter.appRouter.back();
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Please... Add info about your record"),
                            ));
                          }
                        },
                      ))
                ],
              ),
            ),
          )),
    );
  }
}

import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Widgets/Rows/DateTimeWidget.dart';
import 'package:bmi1/Widgets/Rows/LengthRow.dart';
import 'package:bmi1/Widgets/Rows/WeightRow.dart';
import 'package:bmi1/Widgets/Text/MainText.dart';
import 'package:bmi1/Widgets/Buttons/MyButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum Gender { Male, Female }

class CompleteScreen extends StatelessWidget {
  static final routeName = 'complete';

  const CompleteScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Colors.blue,
          width: 5.w,
        )),
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              elevation: 0,
              title: Text('BMI Analyzer'),
              centerTitle: true,
            ),
            body: Consumer<AuthProvider>(
              builder: (context, provider, c) => SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100.h,
                      ),
                      MainText(
                        txt: 'Complete Your',
                      ),
                      MainText(
                        txt: 'Information',
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 35.w,
                          ),
                          Text(
                            'Gender',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp),
                          ),
                          SizedBox(
                            width: 80.w,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 30.w,
                                child: Radio(
                                  value: Gender.Male,
                                  groupValue: provider.gender,
                                  onChanged: (x) {
                                    provider.changeState(x);
                                  },
                                ),
                              ),
                              Text(
                                'Male',
                              )
                            ],
                          ),
                          SizedBox(
                            width: 40.w,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 30.w,
                                child: Radio(
                                  value: Gender.Female,
                                  groupValue: provider.gender,
                                  onChanged: (x) {
                                    provider.changeState(x);
                                  },
                                ),
                              ),
                              Text(
                                'Female',
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      WeightRow(),
                      SizedBox(
                        height: 30.h,
                      ),
                      LengthRow(),
                      SizedBox(
                        height: 30.h,
                      ),
                      DateTimeWidget(
                        inputType: TextInputType.datetime,
                        label: 'Date Of Birth',
                        textEditingController: provider.dateBirth,
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      MyButton(
                        function: () {
                          provider.completeRegistration();
                        },
                        label: 'Save Data',
                      )
                    ]),
              ),
            )));
  }
}

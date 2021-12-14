import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Services/Router.dart';
import 'package:bmi1/Widgets/Buttons/CustomClick.dart';
import 'package:bmi1/Widgets/Rows/DateTimeWidget.dart';
import 'package:bmi1/Widgets/DropDownButton/dropRow.dart';
import 'package:bmi1/Widgets/Text/MainText.dart';
import 'package:bmi1/Widgets/DropDownButton/smallDrop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewFood extends StatelessWidget {
  static final routeName = 'newFood';

  NewFood();

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
                  backgroundColor:Color(0xff0B85D8),
                  elevation: 0,
                  title: Text('BMI Analyzer'),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  child: Column(children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    Center(
                        child: MainText(
                      txt: 'Add Food Details',
                    )),
                    SizedBox(
                      height: 100.h,
                    ),
                    DateTimeWidget(
                      label: 'Name',
                      textEditingController: provider.nameFoods,
                      space: 70.w,
                      inputType: TextInputType.name,
                    ),
                   SizedBox(height: 20,),
                   dropRow(
                     title: 'Category',
                   ),
                    Container(
                      margin: EdgeInsets.only(left: 30.w, top: 30.h),
                      child: Row(
                        children: [
                          Text(
                            'Calory',
                            style: TextStyle(
                                color: Color(0xff0B85D8),
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 70.h,
                          ),
                          Container(
                              width: 50.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff0B85D8))),
                              child: TextField(
                                controller: provider.caloryFoods,
                                style: TextStyle(color: Color(0xff0B85D8)),
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              )),
                          SizedBox(width: 10,),
                          Container(
                              width: 85.w,
                              height: 30.h,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xff0B85D8))),
                              child: smallDrop())
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 264.w, top: 20.h),
                      child: Text(
                        'Photo',
                        style: TextStyle(
                            color: Color(0xff0B85D8),
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 10.h, bottom: 5.h, right: 40.w),
                      width: 280.w,
                      height: 250.h,
                      decoration:
                          BoxDecoration(border: Border.all(color: Color(0xff0B85D8))),
                      child: provider.file == null
                          ? Center(child: Text('No Picture found.. please select photo '))
                          : Image.file(provider.file, fit: BoxFit.cover),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20.w, top: 20.h),
                      child: Row(
                        children: [
                          CustomClick(
                            width: 145.w,
                            label: 'Upload Photo',
                            function: () {
                              provider.selectFile();
                            },
                          ),
                          CustomClick(
                            width: 100.w,
                            function: () {
                              if (provider.caloryFoods.text.length != 0 &&
                                  provider.nameFoods.text.length != 0) {
                                provider.addNewFood();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text("Successfully Added The Food"),
                                ));
                                AppRouter.appRouter.back();
                              } else {
                                provider.clearController();
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(
                                      "Please... Add info about your food"),
                                ));
                              }
                            },
                            label: 'Save',
                          ),
                        ],
                      ),
                    )
                  ]),
                ))));
  }
}

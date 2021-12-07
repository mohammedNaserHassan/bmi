import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Services/Router.dart';
import 'package:bmi1/Widgets/Buttons/CustomClick.dart';
import 'package:bmi1/Widgets/Rows/DateTimeWidget.dart';
import 'package:bmi1/Widgets/Text/MainText.dart';
import 'package:bmi1/Widgets/myDropDown.dart';
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
                    Container(
                        margin: EdgeInsets.only(left: 30.w, top: 30.h),
                        child: Row(children: [
                          Text(
                            'Category',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 45.w,
                          ),
                          Container(
                            width: 140.w,
                            height: 35.h,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue)),
                            child: MyDropDown(
                              hint: 'Select Category',
                            ),
                          ),
                          Container(
                            width: 20.w,
                            height: 35.h,
                            child: Icon(
                              Icons.arrow_drop_down_outlined,
                              color: Colors.blue,
                            ),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blue)),
                          )
                        ])),
                    Container(
                      margin: EdgeInsets.only(left: 30.w, top: 30.h),
                      child: Row(
                        children: [
                          Text(
                            'Calory',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 70.h,
                          ),
                          Container(
                              width: 100.w,
                              height: 35.h,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue)),
                              child: TextField(
                                controller: provider.caloryFoods,
                                style: TextStyle(color: Colors.blue),
                                keyboardType: TextInputType.number,
                                decoration:
                                    InputDecoration(border: InputBorder.none),
                              )),
                          Text('\t cal\t/g')
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 250.w, top: 20.h),
                      child: Text(
                        'Photo',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(top: 10.h, bottom: 5.h, right: 60.w),
                      width: 260.w,
                      height: 250.h,
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.blue)),
                      child: provider.file == null
                          ? CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Icon(
                                Icons.add_a_photo_outlined,
                                size: 35.sp,
                              ),
                            )
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
                              if (provider.caloryFoods.text != null &&
                                  provider.nameFoods.text != null) {
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

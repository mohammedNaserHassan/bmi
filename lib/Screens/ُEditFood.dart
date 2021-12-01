import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Widgets/Buttons/CustomClick.dart';
import 'package:bmi1/Widgets/Rows/DateTimeWidget.dart';
import 'package:bmi1/Widgets/Text/MainText.dart';
import 'package:bmi1/Widgets/myDropDown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditFoof extends StatelessWidget {
  static final routeName = 'EditFoof';

  EditFoof();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context, provider, v) =>
            Container(
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
                    body: SingleChildScrollView(
                      child: Column(children: [
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                            child: MainText(
                              txt: 'Add Food Details',
                            )),
                        SizedBox(
                          height: 100,
                        ),
                        DateTimeWidget(
                          label: 'Name',
                          textEditingController: provider.nameFood,
                          space: 70,
                          inputType: TextInputType.name,
                        ),
                        Container(
                            margin: EdgeInsets.only(left: 30, top: 30),
                            child: Row(children: [
                              Text(
                                'Category',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 45,
                              ),
                              Container(
                                width: 140,
                                height: 35,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue)),
                                child: MyDropDown(
                                  hint: '',),
                              ),
                              Container(
                                width: 20,
                                height: 35,
                                child: Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Colors.blue,
                                ),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.blue)),
                              )
                            ])),
                        Container(
                          margin: EdgeInsets.only(left: 30, top: 30),
                          child: Row(
                            children: [
                              Text(
                                'Calory',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 70,
                              ),
                              Container(
                                  width: 100,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.blue)),
                                  child: TextField(
                                    controller: provider.calory,
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
                          margin: EdgeInsets.only(right: 250, top: 20),
                          child: Text(
                            'Photo',
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 10, bottom: 5, right: 60),
                          width: 260,
                          height: 250,
                          decoration:
                          BoxDecoration(border: Border.all(color: Colors.blue)),
                          child:
                          CircleAvatar(
                              radius: 80,)
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            children: [
                              CustomClick(
                                width: 145,
                                label: 'Upload Photo',
                                function: () {
                                 // provider.captureUpdateFoodImage();
                                },
                              ),
                              CustomClick(
                                width: 100,
                                function: () {
                                //  provider.updateFood();
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

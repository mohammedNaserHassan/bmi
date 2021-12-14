import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Screens/FoodList.dart';
import 'package:bmi1/Services/Router.dart';
import 'package:bmi1/Widgets/Buttons/CustomClick.dart';
import 'package:bmi1/Widgets/Rows/DateTimeWidget.dart';
import 'package:bmi1/Widgets/Text/MainText.dart';
import 'package:bmi1/Widgets/DropDownButton/myDropDown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditFoof extends StatelessWidget {
  static final routeName = 'EditFoof';
int number;
  EditFoof({this.number});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
        builder: (context, provider, v) =>
            Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff0B85D8),
                      width: 5,
                    )),
                child: Scaffold(
                    appBar: AppBar(
                      leading: IconButton(
                        onPressed: (){
                          AppRouter.appRouter.gotoPagewithReplacment(FoodList.routeName);
                          provider.updatedFile=null;
                          provider.getFoods();
                        },
                          icon: Icon(Icons.arrow_back,color: Colors.white,
                          )),
                      backgroundColor: Color(0xff0B85D8),
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
                                    color: Color(0xff0B85D8),
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
                                    border: Border.all(color: Color(0xff0B85D8))),
                                child: MyDropDown(
                                  hint: provider.valueDrop,),
                              ),

                            ])),
                        Container(
                          margin: EdgeInsets.only(left: 30, top: 30),
                          child: Row(
                            children: [
                              Text(
                                'Calory',
                                style: TextStyle(
                                    color: Color(0xff0B85D8),
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
                                      border: Border.all(color: Color(0xff0B85D8))),
                                  child: TextField(
                                    controller: provider.calory,
                                    style: TextStyle(color: Color(0xff0B85D8)),
                                    keyboardType: TextInputType.number,
                                    decoration:
                                    InputDecoration(border: InputBorder.none,),
                                  )),
                              Text(provider.valueCalores)
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 264, top: 20),
                          child: Text(
                            'Photo',
                            style: TextStyle(
                                color: Color(0xff0B85D8),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 10, bottom: 5, right: 45),
                          width: 270,
                          height: 250,
                          decoration:
                          BoxDecoration(border: Border.all(color: Color(0xff0B85D8))),
                          child:provider.updatedFile==null?
                              Image.network(provider.transferImage,fit: BoxFit.cover,):
                          Image.file(provider.updatedFile,fit: BoxFit.cover,)
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 20),
                          child: Row(
                            children: [
                              CustomClick(
                                width: 145,
                                label: 'Upload Photo',
                                function: () {
                                  provider.captureUpdateFoodImage();
                                },
                              ),
                              CustomClick(
                                width: 100,
                                function: () {
                                provider.editFood(number);
                                AppRouter.appRouter.gotoPagewithReplacment(FoodList.routeName);
                                provider.updatedFile=null;
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

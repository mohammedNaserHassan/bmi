import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Widgets/Rows/DateTimeWidget.dart';
import 'package:bmi1/Widgets/Rows/LengthRow.dart';
import 'package:bmi1/Widgets/Rows/WeightRow.dart';
import 'package:bmi1/Widgets/Text/MainText.dart';
import 'package:bmi1/Widgets/Buttons/MyButton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
              builder: (context, provider, c) => SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      MainText(
                        txt: 'Complete Your',
                      ),
                      MainText(
                        txt: 'Information',
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 35,
                          ),
                          Text(
                            'Gender',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            width: 80,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 30,
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
                            width: 40,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 30,
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
                        height: 20,
                      ),
                      WeightRow(),
                      SizedBox(
                        height: 30,
                      ),
                      LengthRow(),
                      SizedBox(
                        height: 30,
                      ),
                      DateTimeWidget(label: 'Date Of Birth',textEditingController: provider.dateBirth,),
                      SizedBox(
                        height: 70,
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

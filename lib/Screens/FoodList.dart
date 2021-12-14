import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Screens/MainScreen.dart';
import 'package:bmi1/Services/Router.dart';
import 'package:bmi1/Widgets/FoodWidget.dart';
import 'package:bmi1/Widgets/Text/MainText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FoodList extends StatelessWidget {
  static final routeName = 'foodList';

  FoodList();

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            border: Border.all(
          color: Color(0xff0B85D8),
          width: 5,
        )),
        child: Consumer<AuthProvider>(
            builder: (context, provider, c) => Scaffold(
                  appBar: AppBar(
                    leading: IconButton(
                        onPressed: () {
                          provider.updateFoodsAfterDelete();
                          AppRouter.appRouter
                              .gotoPagewithReplacment(MainScreen.routeName);
                          provider.getFoods();
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
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
                        height: 20.h,
                      ),
                      Center(
                          child: MainText(
                        txt: 'Food List',
                      )),
                      SizedBox(
                        height: 50.h,
                      ),
                      SizedBox(
                        width: 300.w,
                        height: 600.h,
                        child: provider.Myfoods == null
                            ? Center(
                                child: LinearProgressIndicator(),
                              )
                            : provider.Myfoods.length == 0
                                ? Center(
                                    child: Text(
                                      'No there food yet!!',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                          backgroundColor: Color(0xff0B85D8),
                                          fontSize: 25.sp),
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: provider.Myfoods.length,
                                    itemBuilder: (context, index) => FoodWidget(
                                      number: index,
                                      name: provider.Myfoods[index].name,
                                      image: provider.Myfoods[index].photo,
                                      calory: provider.Myfoods[index].calory,
                                      category:
                                          provider.Myfoods[index].category,
                                    ),
                                  ),
                      ),
                    ],
                  )),
                )));
  }
}

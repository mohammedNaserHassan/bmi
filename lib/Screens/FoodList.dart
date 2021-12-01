import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Widgets/FoodWidget.dart';
import 'package:bmi1/Widgets/Text/MainText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FoodList extends StatelessWidget {
  static final routeName = 'foodList';

  FoodList();

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
                  child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                    child: MainText(
                  txt: 'Food List',
                )),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 300,
                  height: 600,
                  child: provider.Myfoods == null
                      ? Center(
                          child: LinearProgressIndicator(),
                        )
                      : ListView.builder(
                          itemCount: provider.Myfoods.length,
                          itemBuilder: (context, index) => FoodWidget(
                            id: provider.Myfoods[index]['id'],
                            name: provider.Myfoods[index]['name'],
                            image: provider.Myfoods[index]['photo'],
                            calory: provider.Myfoods[index]['calory'],
                            category: provider.Myfoods[index]['category'],
                          ),
                        ),
                )
              ])),
            )));
  }
}

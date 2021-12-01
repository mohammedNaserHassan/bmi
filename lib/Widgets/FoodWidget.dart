import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Screens/%D9%8FEditFood.dart';
import 'package:bmi1/Services/Router.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Buttons/CustomClick.dart';

class FoodWidget extends StatelessWidget {
  String image,name,category,id;
  double calory;
  Future close;
  FoodWidget({this.image,this.category,this.name,this.calory,this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Consumer<AuthProvider>(
        builder: (context,provider,c)=>Row(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
              width: 90,
              height: 80,
              child: Image.network(
               image,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              //margin: EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
              ),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Text(
                           name,
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 30,top: 5),
                          child: CustomClick(
                            height: 30,
                            width: 68.0,
                            function: () {
                              AppRouter.appRouter.gotoPage(EditFoof.routeName);

                            },
                            label: 'Edit',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 110),
                    child: Text(
                      category,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(
                          '$calory\t cal\t/g',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 62),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 28.0,
                              height: 26.0,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10),
                                    topLeft: Radius.circular(10)
                                  )),
                              child: IconButton(
                                onPressed: (){
                                },
                                icon: Icon(
                                  Icons.close,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

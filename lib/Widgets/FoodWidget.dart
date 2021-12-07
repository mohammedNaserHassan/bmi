import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Screens/%D9%8FEditFood.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Buttons/CustomClick.dart';

class FoodWidget extends StatelessWidget {
  String image, name, category, calory;
  int number;

  FoodWidget({this.image, this.category, this.name, this.calory, this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      margin: EdgeInsets.symmetric(
        vertical: 20.h,
      ),
      child: Consumer<AuthProvider>(
        builder: (context, provider, c) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 90.w,
              height: 80.h,
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
            VerticalDivider(
              color: Colors.blue,
              width: 1.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80.w,
                  margin: EdgeInsets.only(left: 7.w, bottom: 7.h, top: 3.h),
                  child: Text(
                    name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 7.w, bottom: 10.h),
                  child: Text(
                    category,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 7.w),
                  child: Text(
                    '$calory\t cal\t/g',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    provider.updateFields(number);
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (x) => EditFoof(number: number)));
                  },
                  child: Container(
                      child: Center(
                          child: Text(
                        'Edit',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.sp),
                      )),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5)),
                      height: 28.h,
                      width: 69.w,
                      margin:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 3.w)),
                ),
                InkWell(
                  onTap: () {
                    provider.deleteFood(number);
                  },
                  child: Container(
                    width: 28.0.w,
                    height: 26.0.h,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            topLeft: Radius.circular(10))),
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

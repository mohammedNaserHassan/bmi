import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class WeightRow extends StatelessWidget {
  double sizebox,width;
  String title,unit;
  bool found;
  WeightRow({this.sizebox=30,this.title="Weight",this.found=true,this.unit='kg',this.width=110});
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context, provider, m) => Row(
        children: [
          SizedBox(
            width: sizebox,
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.sp,
                color: Color(0xff0B85D8)),
          ),
          SizedBox(
            width: 83.w,
          ),
          Visibility(
            visible: found,
            child: Container(
                width: 25.w,
                height: 25.h,
                decoration: BoxDecoration(border: Border.all(color: Color(0xff0B85D8))),
                child: InkWell(
                  onTap: () {
                    provider.decrementWeight();
                  },
                  child: Icon(
                    Icons.remove,
                    color: Color(0xff0B85D8),
                  ),
                )),
          ),
          Container(
            width: width,
            height: 25.h,
            decoration: BoxDecoration(border: Border.all(color: Color(0xff0B85D8))),
            child: TextField(
              controller: provider.weight,
              style: TextStyle(color: Color(0xff0B85D8)),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hoverColor: Color(0xff0B85D8),
              ),
            ),
          ),
          Visibility(
            visible: found,
            child: Container(
                width: 25.w,
                height: 25.h,
                decoration: BoxDecoration(border: Border.all(color: Color(0xff0B85D8))),
                child: InkWell(
                  onTap: () {
                    provider.incrementWeight();
                  },
                  child: Icon(
                    Icons.add,
                    color:Color(0xff0B85D8),
                  ),
                )),
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            unit,
            style: TextStyle(color: Color(0xff0B85D8)),
          )
        ],
      ),
    );
  }
}

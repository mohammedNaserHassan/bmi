import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'myDropDown.dart';
class dropRow extends StatelessWidget {
  String title;
  double size;
  bool stateDrop;
   dropRow({this.title,this.size=45,this.stateDrop=true});

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context,provider,index)=>Row(
        children: [
          SizedBox(width: 30,),
          Text(
            title,
            style: TextStyle(
                color: Color(0xff0B85D8),
                fontSize: 20.sp,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            width: size,
          ),
          stateDrop?Container(
            width: 155.w,
            height: 30.h,
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xff0B85D8))),
            child: MyDropDown(),
          ):Container(
            width: 155.w,
            height: 30.h,
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xff0B85D8))),
            child: provider.Myfoods == null
                ? Container()
                :DropdownButton2<String>(
      iconEnabledColor: Color(0xff0B85D8),
      underline: Container(
      color: Colors.white,
      ),
              isExpanded: true,
              hint: Text(''),
              value: provider.valueNames,
              onChanged: (value) {
                provider.setValueNames(value);
              },
                items:provider.Myfoods.map((e) => DropdownMenuItem<String>(
                  onTap: (){
                    provider.setUnit(e.unit);
                  },
                  value: e.name,
                  child: Center(child: Text(e.name??'',style: TextStyle( fontSize: 17.0),)),
                )).toList(),
            ),
          ),
        ]),
    );
  }
}

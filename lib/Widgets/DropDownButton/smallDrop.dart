import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class smallDrop extends StatelessWidget {
   smallDrop();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (context,provider,m)=>DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          iconEnabledColor: Color(0xff0B85D8),
          underline: Container(
            color: Colors.white,
          ),
          icon: Container(
              decoration: BoxDecoration(
                  border: Border(left: BorderSide(color: Color(0xff0B85D8),))
              ),
              child: Center(child: Icon(Icons.arrow_drop_down_outlined,size: 33.sp,))),
          isExpanded: true,
          hint: Text(''),
          value: provider.valueCalores,
          items: [
            DropdownMenuItem(
              child: Text('cal/spoon',style: TextStyle(fontSize: 10),),
              value: 'cal/spoon',
            ),
            DropdownMenuItem(
              child: Text('cal/sup',style: TextStyle(fontSize: 10)),
              value: 'cal/sup',
            ),
            DropdownMenuItem(
              child: Text('cal/g',style: TextStyle(fontSize: 10)),
              value: 'cal/g',
            ),
            DropdownMenuItem(
              child: Text('cal/piece',style: TextStyle(fontSize: 10)),
              value: 'cal/piece',
            ),
          ],
          onChanged: (value) {
            provider.setValueCalories(value);
          },
        ),
      ),
    );
  }
}

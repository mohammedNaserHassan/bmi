import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Authintication/UI/LoginScreen.dart';
import 'package:bmi1/Services/Router.dart';
import 'package:bmi1/Widgets/Text/MainText.dart';
import 'package:bmi1/Widgets/Buttons/MyButton.dart';
import 'package:bmi1/Widgets/Text/SubText.dart';
import 'package:bmi1/Widgets/TextFields/MyTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  static final routeName = 'register';

  const RegisterScreen();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        color: Color(0xff0B85D8),
        width: 5.w,
      )),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0B85D8),
          elevation: 0,
          title: Text('BMI Analyzer'),
          centerTitle: true,
        ),
        body: Consumer<AuthProvider>(
          builder: (context, provider, index) => SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100.h,
                ),
                MainText(
                  txt: 'Create New Account',
                ),
                SizedBox(
                  height: 10.h,
                ),
                SubText(
                  txt: 'If you do not already have an account',
                ),
                SizedBox(
                  height: 50.h,
                ),
                MyTextField(
                  textEditingController: provider.name,
                  label: 'Name',
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyTextField(
                  textEditingController: provider.email,
                  label: 'Email',
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyTextField(
                  textEditingController: provider.password,
                  label: 'Password',
                  obscure: true,
                ),
                SizedBox(
                  height: 20.h,
                ),
                MyTextField(
                  textEditingController: provider.rePassword,
                  label: 'Re-Password',
                ),
                SizedBox(
                  height: 60.h,
                ),
                MyButton(
                  label: 'CREATE',
                  function: provider.register
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You Have An Account?',
                      style: TextStyle(
                          fontSize: 13.sp, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () {
                          AppRouter.appRouter.goReplacement(LoginScreen());
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 18.sp),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

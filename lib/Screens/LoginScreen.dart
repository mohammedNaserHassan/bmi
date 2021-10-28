import 'package:bmi1/Screens/HomeScreen.dart';
import 'package:bmi1/Screens/RegisterScreen.dart';
import 'package:bmi1/Services/Router.dart';
import 'package:bmi1/Widgets/MainText.dart';
import 'package:bmi1/Widgets/MyButton.dart';
import 'package:bmi1/Widgets/MyTextField.dart';
import 'package:bmi1/Widgets/SubText.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen();

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
             MainText(txt: 'Welcome Back',),
              SizedBox(
                height: 10,
              ),
              SubText(txt: 'If you already have an account,log in',),
              SizedBox(
                height: 50,
              ),
              MyTextField(
                label: 'Username',
              ),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                label: 'Password',
                obscure: true,
              ),
              SizedBox(
                height: 60,
              ),
              MyButton(
                label: 'LOG IN',
                function: (){AppRouter.appRouter.goReplacement(HomeScreen());},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You Don\'t Have An Account?',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        AppRouter.appRouter.goReplacement(RegisterScreen());
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

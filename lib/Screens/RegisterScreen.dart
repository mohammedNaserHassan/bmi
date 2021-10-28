import 'package:bmi1/Screens/LoginScreen.dart';
import 'package:bmi1/Services/Router.dart';
import 'package:bmi1/Widgets/MainText.dart';
import 'package:bmi1/Widgets/MyButton.dart';
import 'package:bmi1/Widgets/MyTextField.dart';
import 'package:bmi1/Widgets/SubText.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen();

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
              MainText(txt: 'Create New Account',),
              SizedBox(
                height: 10,
              ),
              SubText(txt: 'If you do not already have an account',),
              SizedBox(
                height: 50,
              ),
              MyTextField(
                label: 'Name',
              ),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                label: 'Email',
              ),
              SizedBox(
                height: 20,
              ),
              MyTextField(
                label: 'Password',
                obscure: true,
              ),
              SizedBox(height: 20,),
              MyTextField(
                label: 'Re-Password',
              ),
              SizedBox(
                height: 60,
              ),
              MyButton(
                label: 'CREATE',
                function: (){},
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'You Have An Account?',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {
                        AppRouter.appRouter.goReplacement(LoginScreen());
                      },
                      child: Text(
                        'Login',
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

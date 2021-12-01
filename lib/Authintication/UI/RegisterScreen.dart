import 'package:bmi1/Provider/AuthProvider.dart';
import 'package:bmi1/Authintication/UI/LoginScreen.dart';
import 'package:bmi1/Services/Router.dart';
import 'package:bmi1/Widgets/Text/MainText.dart';
import 'package:bmi1/Widgets/Buttons/MyButton.dart';
import 'package:bmi1/Widgets/Text/SubText.dart';
import 'package:bmi1/Widgets/TextFields/MyTextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  static final routeName='register';
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
        body: Consumer<AuthProvider>(
          builder: (context, provider, index) => SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                MainText(
                  txt: 'Create New Account',
                ),
                SizedBox(
                  height: 10,
                ),
                SubText(
                  txt: 'If you do not already have an account',
                ),
                SizedBox(
                  height: 50,
                ),
                MyTextField(
                  textEditingController: provider.name,
                  label: 'Name',
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextField(
                  textEditingController: provider.email,
                  label: 'Email',
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextField(
                  textEditingController: provider.password,
                  label: 'Password',
                  obscure: true,
                ),
                SizedBox(
                  height: 20,
                ),
                MyTextField(
                  textEditingController: provider.rePassword,
                  label: 'Re-Password',
                ),
                SizedBox(
                  height: 60,
                ),
                MyButton(
                  label: 'CREATE',
                  function: () {
                    provider.register();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'You Have An Account?',
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
class MyProvider extends ChangeNotifier{
 bool isEye = false;
 setEye(){
   this.isEye=!this.isEye;
   notifyListeners();
 }
}
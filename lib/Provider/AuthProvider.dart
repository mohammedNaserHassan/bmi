import 'dart:io';
import 'dart:math';

import 'package:bmi1/Authintication/Helper/auth_helper.dart';
import 'package:bmi1/Authintication/Helper/fireStorageHelper.dart';
import 'package:bmi1/Authintication/Helper/fireStore_Helper.dart';
import 'package:bmi1/Authintication/UI/LoginScreen.dart';
import 'package:bmi1/Model/RegisterRequest.dart';
import 'package:bmi1/Screens/CompleteScreen.dart';
import 'package:bmi1/Screens/MainScreen.dart';
import 'package:bmi1/Services/Router.dart';
import 'package:bmi1/Services/customDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider(){
    getUserFromFirestore();
  }
  /////////////Text Editing Controller/////////////////
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController dateBirth = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController length = TextEditingController();


  TextEditingController time = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController calory = TextEditingController();
  TextEditingController nameFood = TextEditingController();


  clearController() {
    name.clear();
    email.clear();
    password.clear();
    rePassword.clear();
    dateBirth.clear();
    weight.clear();
    length.clear();
    calory.clear();
    nameFood.clear();
    time.clear();
    date.clear();
  }

  /////////////////////////////////////////////////////////////

////////DropDown//////////
  String valueDrop;

  setValue(String value) {
    this.valueDrop = value;
    notifyListeners();
  }

  ////////////////////////////////////////////////////////////

  ///////Set Gender///////////
  Gender gender = Gender.Male;

  changeState(Gender value) {
    gender = value;
    notifyListeners();
  }

  ///////////////////////////////////////////////////////////////
  /////////Set Icon of Password/////////
  bool isEye = false;

  setEye() {
    this.isEye = !this.isEye;
    notifyListeners();
  }

///////////////////////////////////////////////////////////////

  //////////Weight///////////////


  incrementWeight() {
    if (this.weight.text != null) {
      double w = double.parse(this.weight.text);
      w=w+0.1;
      this.weight.text = w.toStringAsFixed(1);
    }
    notifyListeners();
  }

  decrementWeight() {
    if (this.weight.text != null&&double.parse(this.weight.text)>0) {
      double w = double.parse(this.weight.text);
      w=w-0.1;
      this.weight.text = w.toStringAsFixed(1);
    }
    notifyListeners();
  }

///////////////////////////////////////////////////////////////

//////////Length///////////////


  incrementLength() {
    if (this.length.text != null) {
      double l = double.parse(this.length.text);
      l=l+0.1;
      this.length.text = l.toStringAsFixed(1);
    }
    notifyListeners();
  }

  decrementLength() {
    if (this.length.text != null&&double.parse(this.length.text)>0) {
      double l = double.parse(this.length.text);
      l=l-0.1;
      this.length.text = l.toStringAsFixed(1);
    }
    notifyListeners();
  }

///////////////////////////////////////////////////////////////

/////Sign up//////////////////////////////
List<Map<String,dynamic>> foodsModel=[];
  List<Map<String,dynamic>> statesModel=[];
  register() async {
    try {
      if (password.text == rePassword.text) {
        UserCredential userCredential =
            await Auth_helper.auth_helper.signup(email.text, password.text);
        RegisterRequest registerRequest = RegisterRequest(
            id: Auth_helper.auth_helper.getUserId(),
            password: password.text,
            rePassword: rePassword.text,
            name: name.text,
            email: email.text,
            dateOfBirth: '',
            gender: '',
            length: '',
            weight: '',
          foods: foodsModel,
          states: statesModel,
        );
        if (password.text.length >= 8) {
          await fireStore_Helper.helper.addUserToFireBase(registerRequest);
          clearController();
          AppRouter.appRouter.gotoPagewithReplacment(CompleteScreen.routeName);
        } else {
          CustomDialog.customDialog
              .showCustom('The password length  must minimum 8');
        }
      } else {
        CustomDialog.customDialog
            .showCustom('The Re-password not equal password');
      }
    } on Exception catch (e) {
      print(e);
    }
    // clearController();
    notifyListeners();
  }

////////////////////////////////////////////////

  //////Login////////////////////////////////////
  login() async {
    if (email.text != null && password.text != null) {
      UserCredential userCredential =
          await Auth_helper.auth_helper.signin(email.text, password.text);
      await fireStore_Helper.helper.getUserFromFirestore();
      AppRouter.appRouter.gotoPagewithReplacment(MainScreen.routeName);
      getUserFromFirestore();
    } else {
      CustomDialog.customDialog.showCustom('Your email or password is empty');
    }
    clearController();
    notifyListeners();
  }


  //////GetCurrent User//////////////////////////////

  RegisterRequest user;

  getUserFromFirestore() async {
    user = await fireStore_Helper.helper.getUserFromFirestore();
    notifyListeners();
  }

  ///////////////
  //////Get My Foods
List<Map<String,dynamic>> Myfoods=[];
List<Map<String,dynamic>> MyStates=[];
  getFoods(){
    getUserFromFirestore();
 Myfoods=user.foods;
 MyStates=user.states;
 notifyListeners();

  }

  //////////////////////////////////////////////////////////////////////////////////

  String myId;
//////Check User Found///////
  checkLogin() {
    bool isLoggin = Auth_helper.auth_helper.checkUser();
    if (isLoggin) {
      this.myId = Auth_helper.auth_helper.getUserId();
      getUserFromFirestore();
      AppRouter.appRouter.gotoPagewithReplacment(MainScreen.routeName);
    } else {
      AppRouter.appRouter.gotoPagewithReplacment(LoginScreen.routeName);
    }
  }

//////////////////////

//////////Complete Register///////////////////////
  completeRegistration() async {
    if (dateBirth.text != null && length.text != null && weight.text != null) {
      getUserFromFirestore();
      RegisterRequest userModel = RegisterRequest(
          id: Auth_helper.auth_helper.getUserId(),
          password: user.password,
          rePassword: user.rePassword,
          name: user.name,
          email: user.email,
          dateOfBirth: dateBirth.text,
          gender: gender.toString(),
          length: length.text,
          weight: weight.text,
        states: statesModel,
        foods: foodsModel,
      );
      await fireStore_Helper.helper.updateProfile(userModel);
      clearController();
      AppRouter.appRouter.gotoPagewithReplacment(MainScreen.routeName);
    } else {
      CustomDialog.customDialog
          .showCustom('Your should fill all fields to enter app');
    }
    clearController();
  }
  ////////////////////////////////////////////////////////////
  //upload Image

  File file;
  selectFile() async {
    XFile imageFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    this.file = File(imageFile.path);
    notifyListeners();
  }
  ///////////
  var rng = new Random();
  int randomly=5;
generateRandom(){
  for (var i = 0; i < 10; i++) {
    randomly= rng.nextInt(100);
  }
  notifyListeners();
}
  /////Add New Food
  addNewFood()async{
    String imageUrl = await fireStorageHelper.helper.uploadImage(file);
    foodsModel.add({
      'name': nameFood.text,
      'category': valueDrop,
      'calory': calory.text,
      'photo': imageUrl,
      'id':randomly
    }
    );
    RegisterRequest userModel = RegisterRequest(
      id: Auth_helper.auth_helper.getUserId(),
      password: user.password,
      rePassword: user.rePassword,
      name: user.name,
      email: user.email,
      dateOfBirth: user.dateOfBirth,
      gender: user.gender,
      length: user.length,
      weight: user.weight,
      states: statesModel,
      foods: foodsModel,);
    await fireStore_Helper.helper.updateProfile(userModel);
    this.file=null;
    clearController();
    notifyListeners();
  }
  //////////////////////////////////////////////////////////////////////////////////

  /////Add New Record
  addNewRecord()async{
    statesModel.add({
      'lengthPerson': length.text,
      'weightPerson': weight.text,
      'dateBirth': date.text,
      'time':time.text
    }
    );
    RegisterRequest userModel = RegisterRequest(
      id: Auth_helper.auth_helper.getUserId(),
      password: user.password,
      rePassword: user.rePassword,
      name: user.name,
      email: user.email,
      dateOfBirth: user.dateOfBirth,
      gender: user.gender,
      length: user.length,
      weight: user.weight,
      states: statesModel,
      foods: foodsModel,);
    await fireStore_Helper.helper.updateProfile(userModel);
    clearController();
    notifyListeners();
  }
  //////////////////////////////////////////////////////////////////////////////////



//////////////////Sign out////////////////////////////////////
  logOut() async {
    await Auth_helper.auth_helper.signOut();
    AppRouter.appRouter.gotoPagewithReplacment(LoginScreen.routeName);
    Auth_helper.auth_helper.firebaseAuth.currentUser.delete();
  }
/////////////////////

}

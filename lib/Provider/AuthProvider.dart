import 'dart:io';

import 'package:bmi1/Authintication/Helper/auth_helper.dart';
import 'package:bmi1/Authintication/Helper/fireStorageHelper.dart';
import 'package:bmi1/Authintication/Helper/fireStore_Helper.dart';
import 'package:bmi1/Authintication/UI/LoginScreen.dart';
import 'package:bmi1/Model/Foods.dart';
import 'package:bmi1/Model/Meal.dart';
import 'package:bmi1/Model/UserModel.dart';
import 'package:bmi1/Model/Status.dart';
import 'package:bmi1/Screens/CompleteScreen.dart';
import 'package:bmi1/Screens/MainScreen.dart';
import 'package:bmi1/Services/Router.dart';
import 'package:bmi1/Services/customDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class AuthProvider extends ChangeNotifier {
  AuthProvider() {
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
  TextEditingController caloryFoods = TextEditingController();
  TextEditingController nameFoods = TextEditingController();

  /////////////Clear Controller/////////////////
  clearController() {
    name.clear();
    nameFoods.clear();
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
    caloryFoods.clear();
  }

/////////////////////////////////////////////////////////////////////////////////////

////////DropDown//////////
  String valueDrop;

  setValue(String value) {
    this.valueDrop = value;
    notifyListeners();
  }

  String valueNames;

  setValueNames(String value) {
    this.valueNames = value;
    notifyListeners();
  }

  String valueCalores;

  setValueCalories(String value) {
    this.valueCalores = value;
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

  ////////////Check Last Two Records
  String differenceBI="";

  checkLastTwoRecords({String finalState, double difference}){
    if (difference < -1) {
      switch (finalState) {
        case "UnderWeight": differenceBI = "So Bad";     break;
        case "Healthy Weight": differenceBI = "So Bad";  break;
        case "Overweight":   differenceBI = "Be Careful"; break;
        case "Obesity":  differenceBI = "Go Ahead";   break;
      }
    } else if (difference < -0.6 && difference >= -1) {
      switch (finalState) {
        case "UnderWeight": differenceBI = "So Bad";  break;
        case "Healthy Weight": differenceBI = "Be Careful"; break;
        case "Overweight":   differenceBI = "Go Ahead";    break;
        case "Obesity":  differenceBI = "Go Ahead";   break;
      }
    } else if (difference < -0.3 && difference >= -0.6) {
      switch (finalState) {
        case "UnderWeight": differenceBI = "So Bad"; break;
        case "Healthy Weight": differenceBI = "Be Careful";  break;
        case "Overweight": differenceBI = "Still Good";  break;
        case "Obesity": differenceBI = "Little Changes"; break;
      }
    } else if (difference < 0 && difference >= -0.3) {
      switch (finalState) {
        case "UnderWeight": differenceBI = "Little Changes"; break;
        case "Healthy Weight":differenceBI = "Little Changes"; break;
        case "Overweight": differenceBI = "Little Changes"; break;
        case "Obesity": differenceBI = "Little Changes"; break;
      }
    } else if (difference < 0.3 && difference >= 0) {
      switch (finalState) {
        case "UnderWeight":
          differenceBI = "Little Changes"; break;
        case "Healthy Weight": differenceBI = "Little Changes"; break;
        case "Overweight": differenceBI = "Little Changes"; break;
        case "Obesity": differenceBI = "Be Careful"; break;
      }
    } else if (difference < 0.6 && difference >= 0.3) {
      switch (finalState) {
        case "UnderWeight": differenceBI = "Still Good"; break;
        case "Healthy Weight": differenceBI = "Be Careful"; break;
        case "Overweight": differenceBI = "Be Careful"; break;
        case "Obesity": differenceBI = "So Bad"; break;
      }
    } else if (difference < 1.0 && difference >= 0.6) {
      switch (finalState) {
        case "UnderWeight": differenceBI = "Go Ahead"; break;
        case "Healthy Weight": differenceBI = "Be Careful"; break;
        case "Overweight": differenceBI = "So Bad"; break;
        case "Obesity": differenceBI = "So Bad"; break;
      }
    } else if (difference >= 1.0) {
      switch (finalState) {
        case "UnderWeight": differenceBI = "Go Ahead";break;
        case "Healthy Weight": differenceBI = "Be Careful"; break;
        case "Overweight": differenceBI = "So Bad"; break;
        case "Obesity": differenceBI = "So Bad"; break;
      }
    }
    notifyListeners();
  }

  //////////////////////////////////////////////////////////////////////////////////////////////////////

  /////Get Last record
  double lastBMI;
  String lastStatus;
   getLastStatus(){
     lastStatus= setBMI(bmi:getBMI(
          weight: double.parse(myRecords[0].weight),
    length: double.parse(myRecords[0].length),
    ageParcent: getAgePercent(
    gender: user.gender,
    age: user.dateOfBirth
    )));
    notifyListeners();

  }
  ///////////////////////////////////////////////////////////////

  //////////////////get Age Percent
  double agePercent;
  static final DateFormat formatter = DateFormat('yyyy');
  String formatted = formatter.format(DateTime.now());
  int age;

  double getAgePercent({String gender, String age}) {
    List<String> ages = age.split('/');
    this.age = int.parse(formatted) - int.parse(ages[0]);
    if (this.age > 2 && this.age < 10) {
      agePercent = 0.7;
    } else if (this.age > 20) {
      agePercent = 1.0;
    } else {
      if (gender == 'Gender.Male') {
        agePercent = 0.9;
      } else {
        agePercent = 0.8;
      }
    }
  return agePercent;
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////

  /////////Calculate  BMI of User/////////
  double bmi;

  double getBMI({double weight, double length, double ageParcent}) {
    length = length / 100;
    length = length * length;
    return (weight / length) * ageParcent;
  }

///////////////////////////////////////////////////////////////

  ////Set state of BMI
  String setBMI({double bmi}) {
    if (bmi < 18.5) {
      return "UnderWeight";
    } else if (bmi >= 18.5 && bmi < 25) {
      return "Healthy Weight";
    } else if (bmi >= 25 && bmi < 30) {
      return "Overweight";
    } else {
      return "Obesity";
    }
  }

  /////////Set Icon of Password/////////
  bool isEye = true;

  setEye() {
    this.isEye = !this.isEye;
    notifyListeners();
  }

///////////////////////////////////////////////////////////////

  //////////Weight///////////////
  incrementWeight() {
    if (this.weight.text != null) {
      double w = double.parse(this.weight.text);
      w = w + 0.1;
      this.weight.text = w.toStringAsFixed(1);
    }
    notifyListeners();
  }

  decrementWeight() {
    if (this.weight.text != null && double.parse(this.weight.text) > 0) {
      double w = double.parse(this.weight.text);
      w = w - 0.1;
      this.weight.text = w.toStringAsFixed(1);
    }
    notifyListeners();
  }

///////////////////////////////////////////////////////////////

//////////Length///////////////
  incrementLength() {
    if (this.length.text != null) {
      double l = double.parse(this.length.text);
      l = l + 0.1;
      this.length.text = l.toStringAsFixed(1);
    }
    notifyListeners();
  }

  decrementLength() {
    if (this.length.text != null && double.parse(this.length.text) > 0) {
      double l = double.parse(this.length.text);
      l = l - 0.1;
      this.length.text = l.toStringAsFixed(1);
    }
    notifyListeners();
  }

///////////////////////////////////////////////////////////////

/////Sign up//////////////////////////////
  register() async {
    try {
      if (password.text == rePassword.text) {
        if (password.text.length >= 8) {
          AppRouter.appRouter.gotoPagewithReplacment(CompleteScreen.routeName);
          await Auth_helper.auth_helper.signup(email.text, password.text);
          await Auth_helper.auth_helper.signin(email.text, password.text);
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
    notifyListeners();
  }

///////////////////////////////////////////////

  //////Login////////////////////////////////////
  login() async {
    if (email.text.length != 0 && password.text.length != 0) {
      UserCredential userCredential =
          await Auth_helper.auth_helper.signin(email.text, password.text);
      await fireStore_Helper.helper.getUserFromFirestore();
      AppRouter.appRouter.gotoPagewithReplacment(MainScreen.routeName);
      getUserFromFirestore();
    } else {
      Fluttertoast.showToast(
          msg: 'Your email or password is empty',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          fontSize: 16.0);
    }
    clearController();
    notifyListeners();
  }

  ////////////////////////////////////////////////////////////////////////////////
double getDifference(int num){
   double current= getBMI(
     weight: double.parse(myRecords.first.weight),
     length: double.parse(myRecords.first.length),
     ageParcent: getAgePercent(
         gender: user.gender,
         age: user.dateOfBirth
     ),
   );
   double last= getBMI(
     weight: double.parse(myRecords[num].weight),
     length: double.parse(myRecords[num].length),
     ageParcent: getAgePercent(
         gender: user.gender,
         age: user.dateOfBirth
     ),
   );
   return current-last;
}
  //////GetCurrent User//////////////////////////////
  UserModel user;

  getUserFromFirestore() async {
    user = await fireStore_Helper.helper.getUserFromFirestore();
    getRecords();
    getLastStatus();
    checkLastTwoRecords(finalState: lastStatus,difference:getDifference(myRecords.length-1) );
    getFoods();
    notifyListeners();
  }

  //////////////////////////////////////////////////////////////////////////////////////////

  //////Get My Foods///////////////
  List<Food> Myfoods;

  getFoods() {
    Myfoods = user.foods.entries.map((e) => Food.fromMap(e.value)).toList();
    notifyListeners();
  }

  //////////////////////////////////////////////////////////////////////////////////////////

  /////delete Food
  deleteFood(int id) async {
    Myfoods.removeAt(id);
    counterFood--;
    notifyListeners();
  }

  ////and update the list foods after deletion
  updateFoodsAfterDelete() async {
    user.foods.clear();
    Myfoods.forEach((element) {
      user.foods.addEntries([MapEntry('$counterFood', element.toMap())]);
      counterFood++;
    });
    fireStore_Helper.helper.updateProfile(user);
    notifyListeners();
  }

  //////////////////////////////////////////////////////////////////////////////////

  //////Get My Records
  List<Record> myRecords;

  getRecords() {
    myRecords = user.states.entries
        .map((e) => Record.fromMap(e.value))
        .toList()
        .reversed
        .toList();
    notifyListeners();
  }

  //////////////////////////////////////////////////////////////////////////////////

//////Check User Found///////
  String myId;

  checkLogin() {
    bool isLoggin = Auth_helper.auth_helper.checkUser();
    if (isLoggin){
      this.myId = Auth_helper.auth_helper.getUserId();
      getUserFromFirestore();
      AppRouter.appRouter.gotoPagewithReplacment(MainScreen.routeName);
    } else {
      AppRouter.appRouter.gotoPagewithReplacment(LoginScreen.routeName);
    }
  }
  ///////////////////////////////////////////////////////////////////////////////////////////

//////////Complete Register///////////////////////
  Map<String, dynamic> foodsModel = {};
  Map<String, dynamic> statesModel = {};
  Map<String, dynamic> mealsModel = {};
  String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String formattedTime = DateFormat.Hms().format(DateTime.now());
String error;
  completeRegistration() async {
    if (dateBirth.text.length != 0 && length.text.length != 0 && weight.text.length != 0) {
        Record record = Record(
          time: formattedTime,
          weight: weight.text,
          length: length.text,
          date: formattedDate,);
        statesModel.addEntries([MapEntry('0', record.toMap())]);
        UserModel userModel = UserModel(
            id: Auth_helper.auth_helper.getUserId(),
            name: name.text,
            email: email.text,
            dateOfBirth: dateBirth.text,
            gender: gender.toString(),
            foods: foodsModel,
            states: statesModel,
            meals: mealsModel
        );
        await  fireStore_Helper.helper.addUserToFireBase(userModel);
        AppRouter.appRouter.gotoPagewithReplacment(MainScreen.routeName);
        getUserFromFirestore();
      // getAgePercent(gender: user.gender, age: user.dateOfBirth);
    } else {
      CustomDialog.customDialog
          .showCustom('Your should fill all fields to enter app');
    }
    clearController();
    notifyListeners();
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

  //////////////////////////////////////////
  String unit="unit";
setUnit(String u){
  this.unit=u;
  notifyListeners();
}
  /////Add New Food
  int counterFood;
  addNewFood() async {
    counterFood=user.foods.length;
    String imageUrl = await fireStorageHelper.helper.uploadImage(file);
    Food newFood = Food(
      unit: valueCalores,
      photo: imageUrl,
      category: valueDrop,
      calory: caloryFoods.text,
      name: nameFoods.text,
    );
    user.foods.addEntries([MapEntry('$counterFood', newFood.toMap())]);
    await fireStore_Helper.helper.updateProfile(user);
    this.file = null;
    this.valueDrop=null;
    this.valueCalores=null;
    clearController();
    getFoods();
    notifyListeners();
  }

  //////////////////////////////////////////////////////////////////////////////////

  /////Add New Record
  addNewRecord() async {
    int counter = user.states.length+1;
    Record record = Record(
        date: date.text,
        length: length.text,
        weight: weight.text,
        time: time.text,
    );
    user.states.addEntries([MapEntry('$counter', record.toMap())]);
    await fireStore_Helper.helper.updateProfile(user);
    getUserFromFirestore();
    clearController();
    notifyListeners();
  }

  ///////////////Update Fields To Update food in Firebase//////////////////
  String transferImage;

  updateFields(int number) {
    this.calory.text = Myfoods[number].calory;
    this.nameFood.text = Myfoods[number].name;
    this.valueDrop = Myfoods[number].category;
    this.valueCalores = Myfoods[number].unit;
    this.transferImage = Myfoods[number].photo;
  }

///////////////////////////////////////////////////////////////////////////////////////////

//////////////Edit Food on Firebase
  editFood(int number) async {
    String imageUrl;
    if (updatedFile != null) {
      imageUrl = await fireStorageHelper.helper.uploadImage(updatedFile);
      Myfoods[number].photo = imageUrl;
    }
    if (calory.text != null) {
      Myfoods[number].calory = calory.text;
    }
    if (valueDrop != null) {
      Myfoods[number].category = valueDrop;
    }
    if (nameFood.text != null) {
      Myfoods[number].name = nameFood.text;
    }

    user.foods.addEntries([MapEntry('$number', Myfoods[number].toMap())]);
    await fireStore_Helper.helper.updateProfile(user);
    clearController();
  }

  ////////////////////////////////////////////////////////////////////////////////////
//////////Select Photo of food to edit
  File updatedFile;
  captureUpdateFoodImage() async {
    XFile file = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.updatedFile = File(file.path);
    notifyListeners();
  }

  /////// /////// /////// /////// /////// /////// /////// /////// /////// /////// /////// ///////
  /////// Add new Meal
  int counter=0;
  addNewMeal()async{
    Meal meal = Meal(
        date: date.text,
        amount: weight.text,
        time: time.text,
        name:valueNames ,);
    user.meals.addEntries([MapEntry('$counter', meal.toMap())]);
    await fireStore_Helper.helper.updateProfile(user);
    AppRouter.appRouter.gotoPagewithReplacment(MainScreen.routeName);
    clearController();
    this.valueNames=null;
    counter++;
    notifyListeners();
  }
  ///////  ///////  ///////  ///////  ///////  ///////  ///////  ///////
//////////////////Sign out////////////////////////////////////
  logOut() async {
    await Auth_helper.auth_helper.signOut();
    AppRouter.appRouter.gotoPagewithReplacment(LoginScreen.routeName);
    this.user = null;
    notifyListeners();
  }
}

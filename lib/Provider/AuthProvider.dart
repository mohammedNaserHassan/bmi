import 'package:bmi1/Authintication/Helper/auth_helper.dart';
import 'package:bmi1/Authintication/Helper/fireStore_Helper.dart';
import 'package:bmi1/Authintication/UI/LoginScreen.dart';
import 'package:bmi1/Model/RegisterRequest.dart';
import 'package:bmi1/Screens/CompleteScreen.dart';
import 'package:bmi1/Screens/MainScreen.dart';
import 'package:bmi1/Services/Router.dart';
import 'package:bmi1/Services/customDialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider extends ChangeNotifier {
  /////////////Text Editing Controller/////////////////
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController dateBirth = TextEditingController();

  clearController() {
    name.clear();
    email.clear();
    password.clear();
    rePassword.clear();
  }

  /////////////////////////////////////////////////////////////

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
  TextEditingController weight = TextEditingController();

  incrementWeight() {
    if (this.weight.text != null) {
      int w = int.parse(this.weight.text);
      w++;
      this.weight.text = w.toString();
    }
    notifyListeners();
  }

  decrementWeight() {
    if (this.weight.text != null) {
      int w = int.parse(this.weight.text);
      w--;
      this.weight.text = w.toString();
    }
    notifyListeners();
  }

///////////////////////////////////////////////////////////////

//////////Length///////////////
  TextEditingController length = TextEditingController();

  incrementLength() {
    if (this.length.text != null) {
      int l = int.parse(this.length.text);
      l++;
      this.length.text = l.toString();
    }
    notifyListeners();
  }

  decrementLength() {
    if (this.length.text != null) {
      int l = int.parse(this.length.text);
      l--;
      this.length.text = l.toString();
    }
    notifyListeners();
  }

///////////////////////////////////////////////////////////////

/////Sign up//////////////////////////////

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
            weight: '');
        await fireStore_Helper.helper.addUserToFireBase(registerRequest);
        await Auth_helper.auth_helper.vereifyEmail();
        await Auth_helper.auth_helper.signOut();
        AppRouter.appRouter.gotoPagewithReplacment(LoginScreen.routeName);
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
      bool isVerified = Auth_helper.auth_helper.checkEmailVerification();
      print(isVerified);
      if (isVerified) {
        AppRouter.appRouter.gotoPagewithReplacment(CompleteScreen.routeName);
      } else {
        CustomDialog.customDialog.showCustom(
            'You have to verify your email,press ok to send another email',
            sendVerification);
      }
    } else {
      CustomDialog.customDialog.showCustom('Your email or password is empty');
    }
    // clearController();
    notifyListeners();
  }

//////////////////////////////////////////////////////

  //////Verification//////////////////////
  sendVerification() {
    Auth_helper.auth_helper.vereifyEmail();
    Auth_helper.auth_helper.signOut();
  }

//////////////////////////////////////////////////////

  //////////////////Reset Password////////////////////////
  resetPassword() async {
    Auth_helper.auth_helper.resetPassword(email.text);
    //clearController();
    AppRouter.appRouter.gotoPagewithReplacment(LoginScreen.routeName);
  }

/////////////

  //////GetCurrent User//////////////////////////////

  RegisterRequest user;

  getUserFromFirestore() async {
    user = await fireStore_Helper.helper.getUserFromFirestore();
    // print(user.toMap());
    notifyListeners();
  }

  ///////////////

  //////Get All Users////////

//////Get All Users////////
  List<RegisterRequest> users;
  String myId;

  getAllUsers() async {
    users = await fireStore_Helper.helper.getAllUsersFromFirestore();
    users.removeWhere((element) => element.id == myId);
    notifyListeners();
  }

/////////////////////
//////Check User Found///////
  checkLogin() {
    bool isLoggin = Auth_helper.auth_helper.checkUser();
    if (isLoggin) {
      this.myId = Auth_helper.auth_helper.getUserId();
      getUserFromFirestore();
      getAllUsers();
      AppRouter.appRouter.gotoPagewithReplacment(CompleteScreen.routeName);
    } else {
      AppRouter.appRouter.gotoPagewithReplacment(LoginScreen.routeName);
    }
  }

//////////////////////

//////////Complete Register///////////////////////
  completeRegistration() async {
    RegisterRequest userModel = RegisterRequest(
        id: Auth_helper.auth_helper.getUserId(),
        password: password.text,
        rePassword: rePassword.text,
        name: name.text,
        email: email.text,
        dateOfBirth: dateBirth.text,
        gender: gender.toString(),
        length: length.text,
        weight: weight.text);
    await fireStore_Helper.helper.updateProfile(userModel);
    getUserFromFirestore();
AppRouter.appRouter.gotoPagewithReplacment(MainScreen.routeName);
  }


////////////////////////////////////////////////////////////

//////////////////Sign out////////////////////////////////////
  logOut() async {
    await Auth_helper.auth_helper.signOut();
    AppRouter.appRouter.gotoPagewithReplacment(LoginScreen.routeName);
  }
/////////////////////

}

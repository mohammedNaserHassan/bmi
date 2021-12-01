import 'package:bmi1/Model/RegisterRequest.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'auth_helper.dart';

class fireStore_Helper {
  fireStore_Helper._();

  static fireStore_Helper helper = fireStore_Helper._();
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

////Add User and Get it
  addUserToFireBase(RegisterRequest registerRequest) async {
    try {
      await firebaseFirestore
          .collection('Users')
          .doc(registerRequest.id)
          .set(registerRequest.toMap());
    } on Exception catch (e) {}
  }

  Future<RegisterRequest> getUserFromFirestore() async {
    String userId = Auth_helper.auth_helper.getUserId();
    DocumentSnapshot documentSnapshot =
    await firebaseFirestore.collection('Users').doc(userId).get();
print(documentSnapshot.data());
    return RegisterRequest.fromMap(documentSnapshot.data());
  }
////////////////////////////////////////////////////////////////////////////////

/////////////////////Update Profile

  updateProfile(RegisterRequest userModel) async {
    await firebaseFirestore
        .collection('Users')
        .doc(userModel.id)
        .update(userModel.toMap());
  }
////////////////////////////////////////////////////////////////////////////////////


}

import 'package:appointment_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final CollectionReference<Map<String, dynamic>> _userCol =
      FirebaseFirestore.instance.collection("user");

  UserModel _userFromFirebase(User user) {
    return UserModel(userID: user.uid);
  }

  Future<UserModel> currentUser() async {
    User user = _auth.currentUser!;
    return _userFromFirebase(user);
  }

  Future<String?> signIn(String email, String password) async {
    String? res;
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      res = "success";
    } on FirebaseAuthException catch (e) {
      debugPrint(e.toString());
      switch (e.code) {
        case "user-not-found":
          res = "Kullanıcı Bulunamadı";
          break;
        case "wrong-password":
          res = "Şifre Yanlış";
          break;
      }
    }
    return res;
  }

  signOut() async {
    return await _auth.signOut();
  }

  Future<String?> signUp(String name, String email, String phoneNumber,
      String password, String gender) async {
    String? res;
    try {
      var userCredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User myUser = userCredential.user!;
      res = "success";
      if (!myUser.emailVerified) {
        await myUser.sendEmailVerification();
      } else {
        return null;
      }
      await _userCol.doc(myUser.uid).set({
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "gender": gender,
        "password": password
      });
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "email-already-in-use":
          res = "Mail Zaten Kayıtlı";
          break;
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          res = "Geçersiz Mail";
          break;
      }
    }
    return res;
  }

  Future<String?> passwordResetMail(String email) async {
    String? res;
    try {
      await _auth.sendPasswordResetEmail(email: email);
      res = "success";
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "ERROR_INVALID_EMAIL":
        case "invalid-email":
          res = "Geçesiz Mail";
          break;
      }
    }
    return res;
  }

  Future<void> passwordUpdate(String newPassword) async {
    await _auth.currentUser!.updatePassword(newPassword);
    await _userCol
        .doc(_auth.currentUser!.uid)
        .update({"password": newPassword});
  }

  Future<void> userNameUpdate(String newUserName) async {
    await _userCol.doc(_auth.currentUser!.uid).update({"name": newUserName});
  }

  Future<void> phoneNumberUpdate(String newPhoneNumber) async {
    await _userCol
        .doc(_auth.currentUser!.uid)
        .update({"phoneNumber": newPhoneNumber});
  }

  Future<void> deleteUser() async {
    var user = _auth.currentUser!;
    await _userCol.doc(user.uid).delete();
  }

  Future<dynamic> addAppointment(String date, String day, String time,
      String doctor, String hospital) async {
    var appointments = _userCol.doc(_auth.currentUser!.uid);

    Map<String, dynamic> addedAppointment = <String, dynamic>{};

    addedAppointment["appointment"] = {
      "date": date,
      "day": day,
      "time": time,
      "doctor": doctor,
      "hospital": hospital
    };

    appointments.set(addedAppointment, SetOptions(merge: true));
  }
}

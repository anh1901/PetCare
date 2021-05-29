import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:petcare/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum authProblems { UserNotFound, PasswordNotValid, NetworkError, UnknownError }
FirebaseAuth auth = FirebaseAuth.instance;

class Auth {
  static Future<String> signUp(String email, String password) async {
    User user = (await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password)) as User;
    return user.uid;
  }

  static Future<bool> checkUserExist(String userId) async {
    bool exists = false;
    try {
      await FirebaseFirestore.instance.doc("users/$userId").get().then((doc) {
        if (doc.exists)
          exists = true;
        else
          exists = false;
      });
      return exists;
    } catch (e) {
      return false;
    }
  }

  static Future<String> signIn(String email, String password) async {
    User user = (await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)) as User;
    return user.uid;
  }

  static Future<UserModel> getUserFirestore(String userId) async {
    if (userId != null) {
      return FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get()
          .then((documentSnapshot) => UserModel.fromDocument(documentSnapshot));
    } else {
      print('firestore userId can not be null');
      return null;
    }
  }

  static Future<String> storeUserLocal(UserModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String storeUser = userToJson(user);
    await prefs.setString('user', storeUser);
    return user.userId;
  }

  static Future<UserModel> getCurrentFirebaseUser() async {
    UserModel currentUser = FirebaseAuth.instance.currentUser as UserModel;
    return currentUser;
  }

  static Future<UserModel> getUserLocal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('user') != null) {
      UserModel user = userFromJson(prefs.getString('user'));
      //print('USER: $user');
      return user;
    } else {
      return null;
    }
  }

  static Future<void> signOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    FirebaseAuth.instance.signOut();
  }

  static Future<void> forgotPasswordEmail(String email) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  }

  static String getExceptionText(Exception e) {
    if (e is PlatformException) {
      switch (e.message) {
        case 'There is no user record corresponding to this identifier. The user may have been deleted.':
          return 'User with this email address not found.';
          break;
        case 'The password is invalid or the user does not have a password.':
          return 'Invalid password.';
          break;
        case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
          return 'No internet connection.';
          break;
        case 'The email address is already in use by another account.':
          return 'This email address already has an account.';
          break;
        default:
          return 'Unknown error occured.';
      }
    } else {
      return 'Unknown error occured.';
    }
  }
}

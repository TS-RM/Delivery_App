import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthFirebase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get user => _firebaseAuth.currentUser;

  Stream<User?> get stateAuth => FirebaseAuth.instance.authStateChanges();

  // Future<String?> getUserToken(User user, BuildContext context) async {
  //   try {
  //     final token = await user.getIdToken();
  //     return token;
  //   } on FirebaseAuthException catch (error) {
  //     AllAlertError().getAlertErrorInFirebase(context, error);
  //   }
  //   return null;
  // }

  Future<UserCredential?> createNewUser(
      String emailAddress, String password, BuildContext context) async {
    // setViewState(ViewState.loading);
    UserCredential credential;
    try {
      credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (error) {
      debugPrint(error.toString());
      // AllAlertError().getAlertErrorInFirebase(context, error);
    } catch (z) {
      // showDialog(
      //   context: context,
      //   builder: (context) => AlertErrorAuth(
      //     textAlert: z.toString(),
      //   ),
      // );
    }
    // setViewState(ViewState.endLoading);
    return null;
  }

  Future<UserCredential?> signIn(
      String emailAddress, String password, BuildContext context) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      return credential;
    } on FirebaseAuthException catch (error) {
      debugPrint(error.toString());
      // AllAlertError().getAlertErrorInFirebase(context, error);
    } catch (z) {
      // showDialog(
      //   context: context,
      //   builder: (context) => AlertErrorAuth(
      //     textAlert: z.toString(),
      //   ),
      // );
    }
    return null;
  }

  void logOut() async {
    await _firebaseAuth.signOut();
  }
}

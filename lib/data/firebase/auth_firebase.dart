import 'package:firebase_auth/firebase_auth.dart';
import 'package:tashil_food_app/data/firebase/auth_error.dart';

class ServiceAuthFirebase {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get user => _firebaseAuth.currentUser;

  Stream<User?> get stateAuth => FirebaseAuth.instance.authStateChanges();

  Future<UserCredential?> createNewUser(
      String emailAddress, String password) async {
    UserCredential credential;
    try {
      credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (error) {
      AlertErrorAuth().getAlertErrorInFirebase(error);
    }
    return null;
  }

  Future<UserCredential?> signInAuth(
    String emailAddress,
    String password,
  ) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      return credential;
    } on FirebaseAuthException catch (error) {
      AlertErrorAuth().getAlertErrorInFirebase(error);
    }
    return null;
  }

  Future<bool?> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException catch (error) {
      print('=============================');
      print(error);
      return false;
    }
  }

  void logOut() async {
    await _firebaseAuth.signOut();
  }
}

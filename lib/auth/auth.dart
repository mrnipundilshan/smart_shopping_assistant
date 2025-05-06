import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  Future<User?> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      log("account create successfully");
      return cred.user;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<User?> loginUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return cred.user;
    } catch (e) {
      log("Error: ${e.toString()}");
    }
    return null;
  }

  Future<void> signout() async {
    try {
      await _auth.signOut();

      // Sign out any previously signed-in user to force account selection
      await GoogleSignIn().signOut();
    } catch (e) {
      log("something went wrong");
    }
  }

  Future<User?> signWithGoogle() async {
    //begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //user cancels google sign in pop up screen
    if (gUser == null) return null;

    //obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser.authentication;

    //create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //finally, sign in!
    final userCredential = await _auth.signInWithCredential(credential);
    return userCredential.user;
  }

  bool isValidEmail(String email) {
    final emailRegex = RegExp(
      r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$",
    );
    return emailRegex.hasMatch(email);
  }
}

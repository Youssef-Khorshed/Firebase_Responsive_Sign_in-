// ignore_for_file: prefer_final_fields, unused_field, non_constant_identifier_names, unused_local_variable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_firebase/Repository/repo.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MyFirebase extends Repository {
  final _auth = FirebaseAuth.instance;
  final _google = GoogleSignIn();
  @override
  Future<User?> Singin_Anonymous() async {
    try {
      UserCredential _user = await _auth.signInAnonymously();
      User user = _user.user!;
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future Google_siginin() async {
    try {
      final account = await _google.signIn();
      if (account == null) {
        return;
      }
      final user = await account.authentication;
      final credential = await GoogleAuthProvider.credential(
          accessToken: user.accessToken, idToken: user.idToken);
      final usercredential = await _auth.signInWithCredential(credential);
      final res = usercredential.user;
      return res;
    } catch (error) {
      print(error);
      return;
    }
  }

  @override
  Future Facebook_siginin() async {
    try {
      final user = await FacebookAuth.instance.login();
      final data = await FacebookAuth.instance.getUserData();
      final credential =
          FacebookAuthProvider.credential(user.accessToken!.token);
      final myuser = await _auth.signInWithCredential(credential);
      final res = myuser.user;
      return res;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  @override
  Future Email_Password_Signin(
      {required String email, required String password}) async {
    try {
      final usercredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = usercredential.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  @override
  Future Create_Email_Password(
      {required String email, required String password}) async {
    try {
      final usercredential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = usercredential.user;
      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}

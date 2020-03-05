import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AbstractAuth {
  Future<String> signIn(String email, String password);

  Future<String> signUp(String username, String email, String password);

  Future<FirebaseUser> getCurrentUser();

  Future<void> emailVerification();

  Future<void> signOut();
}
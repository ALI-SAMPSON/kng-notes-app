import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthDataSource {
  // abstract method to create a note
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  // abstract method to delete a note
  Future<UserCredential> createNewUserWithEmailAndPassword({
    required String fullname,
    required String email,
    required String password,
  });

  // abstract method to delete a note
  Future<QuerySnapshot<Map<String, dynamic>>> getUser({
    required String id,
  });

  Future logout();
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:note_taking_app/data/remote/exceptions/failure.dart';
import 'package:note_taking_app/domain/note_model.dart';
import 'package:note_taking_app/domain/user_model.dart';

abstract class AuthRepository {
  // abstract method to create a note
  Future<Either<Failure, String>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  // abstract method to delete a note
  Future<Either<Failure, String>> createNewUserWithEmailAndPassword({
    required String fullname,
    required String email,
    required String password,
  });

  // abstract method to delete a note
  Future<Either<Failure, UserModel>> getUser({
    required String id,
  });

  // logout successful
  Future<Either<Failure, String>> logout();
}

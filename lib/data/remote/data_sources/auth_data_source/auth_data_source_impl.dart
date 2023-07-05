import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:note_taking_app/app/app_constants.dart';
import 'package:note_taking_app/app/app_di.dart';
import 'package:note_taking_app/data/remote/data_sources/auth_data_source/auth_data_source.dart';
import 'package:note_taking_app/data/remote/wrappers/network_call_wrapper.dart';
import 'package:note_taking_app/data/remote/wrappers/network_info.dart';

class AuthDataSourceImpl extends AuthDataSource {
  final NetworkInfo _networkInfo = instance<NetworkInfo>();

  @override
  Future<UserCredential> createNewUserWithEmailAndPassword(
          {required String fullname,
          required String email,
          required String password}) async =>
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

  @override
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async =>
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getUser(
          {required String id}) async =>
      await firebaseFirestore
          .collection(TAppConstants.tUsers)
          .where(TAppConstants.tId, isEqualTo: id)
          .get();

  @override
  Future logout() async => await firebaseAuth.signOut();
}

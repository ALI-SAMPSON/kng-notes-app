import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final firebaseAuth = FirebaseAuth.instance;
final firebaseFirestore = db();
// firebaseFirestore.settings =;

// create an instance of firestore
FirebaseFirestore db() {
  // create a firebase instance
  final firebaseFirestore = FirebaseFirestore.instance;
  // enable offline persistence on firestore
  firebaseFirestore.settings = const Settings(
    persistenceEnabled: true,
    cacheSizeBytes: Settings.CACHE_SIZE_UNLIMITED,
  );
  return firebaseFirestore;
}

class TAppConstants {
  TAppConstants._();

  static const tDialogAnimDurationInSc = 600;
  static const tDuration1200 = 1200;

  /// firebase constants
  static const tNotes = 'Notes';
  static const tUsers = 'Users';
  static const tId = 'id';
  static const tTitle = 'title';
  static const tTitleSearch = 'titleSearch';
  static const tCreatedAt = 'createdAt';
  static const tCreatedBy = 'createdBy';
}

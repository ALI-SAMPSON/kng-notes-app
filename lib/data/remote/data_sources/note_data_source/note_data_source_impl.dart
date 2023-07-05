import 'package:note_taking_app/app/app_constants.dart';
import 'package:note_taking_app/app/app_di.dart';
import 'package:note_taking_app/data/remote/data_sources/note_data_source/note_data_source.dart';
import 'package:note_taking_app/data/remote/wrappers/network_call_wrapper.dart';
import 'package:note_taking_app/data/remote/wrappers/network_info.dart';
import 'package:note_taking_app/domain/note_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class NoteDataSourceImpl extends NoteDataSource {
  final NetworkInfo _networkInfo = instance<NetworkInfo>();
  @override
  Future createNote({required NoteModel note}) async {
    var docId = firebaseFirestore.collection(TAppConstants.tNotes).doc().id;
    note.id = docId;
    return await firebaseFirestore
        .collection(TAppConstants.tNotes)
        .doc(docId)
        .set(note.toJson());
  }

  @override
  Future deleteNote({required String noteId}) async => await firebaseFirestore
      .collection(TAppConstants.tNotes)
      .doc(noteId)
      .delete();

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getNote(
          {required String noteId}) async =>
      await firebaseFirestore
          .collection(TAppConstants.tNotes)
          .where(TAppConstants.tId, isEqualTo: noteId)
          .get();

  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getNotes(
      {required String userId}) async {
    return await firebaseFirestore.collection(TAppConstants.tNotes).get();
  }

  @override
  Future updateNote({required NoteModel note}) async => await firebaseFirestore
      .collection(TAppConstants.tNotes)
      .doc(note.id)
      .update(note.toJson());
}

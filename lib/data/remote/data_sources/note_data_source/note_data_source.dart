import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:note_taking_app/domain/note_model.dart';

abstract class NoteDataSource {
  // abstract method to create a note
  Future createNote({required NoteModel note});

  // abstract method to get a note
  Future<QuerySnapshot<Map<String, dynamic>>> getNote({required String noteId});

  // abstract method to delete a note
  Future deleteNote({required String noteId});

  // abstract method to delete a note
  Future updateNote({required NoteModel note});

  // abstract method to get all notes
  Future<QuerySnapshot<Map<String, dynamic>>> getNotes(
      {required String userId});
}

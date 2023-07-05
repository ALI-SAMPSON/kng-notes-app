import 'package:note_taking_app/data/remote/exceptions/failure.dart';
import 'package:note_taking_app/domain/note_model.dart';
import 'package:dartz/dartz.dart';

abstract class NoteService {
  // abstract repo method to create a note
  Future<Either<Failure, String>> createNote({required NoteModel note});

  // abstract repo method to get a note
  Future<Either<Failure, NoteModel>> getNote({required String noteId});

  // abstract repo method to delete a note
  Future<Either<Failure, String>> deleteNote({required String noteId});

  // abstract repo method to delete a note
  Future<Either<Failure, String>> updateNote({required NoteModel note});

  // abstract repo method to get all notes
  //Future<Either<Failure, List<NoteModel>>> getNotes({required String userId});
  Stream<List<NoteModel>> getNotes({required String userId});

  Stream<List<NoteModel>> searchNotes(
      {required String userId, required String search});
}

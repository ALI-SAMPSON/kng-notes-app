import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:note_taking_app/app/app_di.dart';
import 'package:note_taking_app/data/remote/data_sources/note_data_source/note_data_source.dart';
import 'package:note_taking_app/data/remote/exceptions/failure.dart';
import 'package:note_taking_app/data/remote/repository/note_repository/note_repository.dart';
import 'package:note_taking_app/data/remote/wrappers/catch_error_wrapper.dart';
import 'package:note_taking_app/domain/note_model.dart';
import 'package:note_taking_app/presentation/resources/app_strings.dart';

class NoteRepositoryImpl extends NoteRepository {
  final _dataSource = instance<NoteDataSource>();
  final _errorWrapper = instance<CatchApiErrorWrapper>();

  @override
  Future<Either<Failure, String>> createNote({required NoteModel note}) async {
    try {
      var snapshot = await _dataSource.createNote(note: note);
      return const Right(TAppStrings.tNoteAddedMsg);
    } on FirebaseException catch (err) {
      return Left(_errorWrapper.handleError(err));
    }
  }

  @override
  Future<Either<Failure, String>> deleteNote({required String noteId}) async {
    try {
      var snapshot = await _dataSource.deleteNote(noteId: noteId);
      return const Right(TAppStrings.tNoteDeletedMsg);
    } on FirebaseException catch (err) {
      return Left(_errorWrapper.handleError(err));
    }
  }

  @override
  Future<Either<Failure, NoteModel>> getNote({required String noteId}) async {
    try {
      var snapshot = await _dataSource.getNote(noteId: noteId);
      var note = snapshot.docs.map((e) => NoteModel.fromSnapShot(e)).single;
      return Right(note);
    } on FirebaseException catch (err) {
      return Left(_errorWrapper.handleError(err));
    }
  }

  @override
  Future<Either<Failure, List<NoteModel>>> getNotes(
      {required String userId}) async {
    try {
      var snapshots = await _dataSource.getNotes(userId: userId);
      var notes =
          await snapshots.docs.map((e) => NoteModel.fromSnapShot(e)).toList();
      return Right(notes);
    } on FirebaseException catch (err) {
      return Left(_errorWrapper.handleError(err));
    }
  }

  @override
  Future<Either<Failure, String>> updateNote({required NoteModel note}) async {
    try {
      var snapshot = await _dataSource.updateNote(note: note);
      return const Right(TAppStrings.tNoteUpdatedMsg);
    } on FirebaseException catch (err) {
      return Left(_errorWrapper.handleError(err));
    }
  }
}

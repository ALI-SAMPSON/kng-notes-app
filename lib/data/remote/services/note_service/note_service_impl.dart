import 'package:dartz/dartz.dart';
import 'package:note_taking_app/app/app_constants.dart';
import 'package:note_taking_app/app/app_di.dart';
import 'package:note_taking_app/data/remote/exceptions/failure.dart';
import 'package:note_taking_app/data/remote/repository/note_repository/note_repository.dart';
import 'package:note_taking_app/data/remote/services/note_service/note_service.dart';
import 'package:note_taking_app/data/remote/wrappers/network_info.dart';
import 'package:note_taking_app/domain/note_model.dart';
import 'package:note_taking_app/presentation/resources/app_strings.dart';

class NoteServiceImpl extends NoteService {
  final _noteRepository = instance<NoteRepository>();

  @override
  Future<Either<Failure, String>> createNote({required NoteModel note}) =>
      _noteRepository.createNote(note: note);

  @override
  Future<Either<Failure, String>> deleteNote({required String noteId}) =>
      _noteRepository.deleteNote(noteId: noteId);

  @override
  Future<Either<Failure, NoteModel>> getNote({required String noteId}) =>
      _noteRepository.getNote(noteId: noteId);

  @override
  Future<Either<Failure, String>> updateNote({required NoteModel note}) =>
      _noteRepository.updateNote(note: note);

  // @override
  // Future<Either<Failure, List<NoteModel>>> getNotes({required String userId}) =>
  //     _noteRepository.getNotes(userId: userId);

  // @override
  // Future<Either<Failure, List<NoteModel>>> getNotes({required String userId}) {
  //   var snapshots =
  //       firebaseFirestore.collection(TAppConstants.tNotes).snapshots();
  //   snapshots.map((e) => null);
  // }

  @override
  Stream<List<NoteModel>> getNotes({required String userId}) {
    return firebaseFirestore
        .collection(TAppConstants.tNotes)
        .where(TAppConstants.tCreatedBy, isEqualTo: userId)
        .orderBy(TAppConstants.tCreatedAt)
        .snapshots()
        .map((snapshots) => snapshots.docs.map((document) {
              return NoteModel.fromJson(document.data());
            }).toList());
  }

  @override
  Stream<List<NoteModel>> searchNotes(
      {required String userId, required String search}) {
    return firebaseFirestore
        .collection(TAppConstants.tNotes)
        .where(TAppConstants.tCreatedBy, isEqualTo: userId)
        .where(TAppConstants.tTitleSearch, arrayContains: search.toLowerCase())
        // .where(TAppConstants.tTitle,
        //     isGreaterThanOrEqualTo: search.toUpperCase())
        // .where(TAppConstants.tTitle, isLessThan: '${search.toUpperCase()}z')
        // .startAt([search])
        // .endAt(['$search\uf8ff'])
        .snapshots()
        .map((snapshots) => snapshots.docs.map((document) {
              return NoteModel.fromJson(document.data());
            }).toList());
  }
}

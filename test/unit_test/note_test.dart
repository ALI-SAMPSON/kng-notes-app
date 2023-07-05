import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_taking_app/app/app_constants.dart';
import 'package:note_taking_app/data/remote/repository/note_repository/note_repository.dart';
import 'package:note_taking_app/domain/note_model.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  group('NoteService', () {
    FakeFirebaseFirestore? fakeFirebaseFirestore;
    Map<String, dynamic> note = {
      'id': '001',
      'title': 'The Note',
      'titleSearch': ['T', 'he', 'Th'],
      'description': 'I am writing a note',
      'createdBy': '005',
      'createdAt': DateTime.now(),
      'updatedAt': DateTime.now()
    };
    NoteRepository? noteRepository;
    const String collectionPath = TAppConstants.tNotes;
    // setup
    setUpAll(() async {
      // WidgetsFlutterBinding.ensureInitialized();
      // await initializeFirebase();
      // await initAppModule();
      fakeFirebaseFirestore = FakeFirebaseFirestore();
      // noteRepository = instance<NoteRepository>();
    });
    // NOTE CREATION TEST
    // do
    group('Collection Operations', () {
      // we can add all test here
      test('createNote add note to given collection', () async {
        // adds a note
        // await noteRepository?.createNote(note: note);
        await fakeFirebaseFirestore
            ?.collection(collectionPath)
            .doc(note['id'])
            .set(note);
        // text to see if note was added
        final List<Map<String, dynamic>> actualNoteList =
            (await fakeFirebaseFirestore!.collection(collectionPath).get())
                .docs
                .map((e) => NoteModel.fromJson(e.data()).toJson())
                .toList();
        expect(actualNoteList.first, note);
      });

      // NOTE UPDATION TEST
      test('updateNote update a given note in collection', () async {
        Map<String, dynamic> note = {
          'id': '001',
          'title': 'The APIs Are Done',
          'titleSearch': ['T', 'he', 'Th'],
          'description': 'I finished them last week ',
          'createdBy': '005',
          'createdAt': DateTime.now(),
          'updatedAt': DateTime.now()
        };
        // update a note
        //await noteRepository?.updateNote(note: note);
        await fakeFirebaseFirestore
            ?.collection(collectionPath)
            .doc(note['id'])
            .update(note);
        final List<Map<String, dynamic>> actualNoteList =
            (await fakeFirebaseFirestore!.collection(collectionPath).get())
                .docs
                .map((e) => NoteModel.fromJson(e.data()).toJson())
                .toList();
        expect(actualNoteList.first, note);
      });
      // NOTE DELETION TEST
      test('deleteNote delete a given note from collection', () async {
        // delete a note
        await fakeFirebaseFirestore
            ?.collection(collectionPath)
            .doc(note['id'])
            .delete();
        final List<Map<String, dynamic>> actualNoteList =
            (await fakeFirebaseFirestore!.collection(collectionPath).get())
                .docs
                .map((e) => NoteModel.fromJson(e.data()).toJson())
                .toList();
        expect(actualNoteList, List.empty());
      });
    });
  });
}

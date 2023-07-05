import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:note_taking_app/app/app_di.dart';
import 'package:note_taking_app/data/remote/repository/note_repository/note_repository.dart';
import 'package:note_taking_app/data/remote/services/note_service/note_service.dart';
import 'package:note_taking_app/data/remote/services/note_service/note_service_impl.dart';
import 'package:note_taking_app/domain/note_model.dart';
import 'package:note_taking_app/firebase_options.dart';
import 'package:note_taking_app/main.dart';

void main() {
  group('NoteService', () {
    FakeFirebaseFirestore? fakeFirebaseFirestore;
    // Map<String, dynamic> data = {
    //   'title': 'The Note',
    //   'description': 'I am writing a note',
    //   'createdBy': '001',
    //   // 'createdAt': DateTime.now(),
    //   // 'updatedAt': DateTime.now()
    // };
    NoteRepository? noteRepository;
    var note = NoteModel(
      title: 'The Note',
      titleSearch: ['T', 'he', 'Th'],
      description: 'I am writing a note',
      createdBy: '001',
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    // setup
    setUpAll(() async {
      WidgetsFlutterBinding.ensureInitialized();
      await initializeFirebase();
      await initAppModule();
      fakeFirebaseFirestore = FakeFirebaseFirestore();
      noteRepository = instance<NoteRepository>();
    });
    // do
    group('Collection Operations', () {
      // we can add all test here
      test('createNote add note to given collection', () async {
        const String collectionPath = 'Notes';
        // adds a note
        await noteRepository?.createNote(note: note);
        //await fakeFirebaseFirestore?.collection(collectionPath).add(data);
        // text to see if note was added
        // final List<Map<String, dynamic>> actualNoteList =
        //     (await fakeFirebaseFirestore!.collection(collectionPath).get())
        //         .docs
        //         .map((e) => e.data())
        //         .toList();
        final List<NoteModel> actualNoteList =
            (await fakeFirebaseFirestore!.collection(collectionPath).get())
                .docs
                .map((e) => NoteModel.fromJson(e.data()))
                .toList();
        expect(actualNoteList.first, note);
      });
    });
  });
}

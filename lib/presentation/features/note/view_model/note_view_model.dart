import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:note_taking_app/app/app_constants.dart';
import 'package:note_taking_app/app/app_di.dart';
import 'package:note_taking_app/commons/widgets/popup_dialogs.dart';
import 'package:note_taking_app/data/remote/services/note_service/note_service.dart';
import 'package:note_taking_app/domain/note_model.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';
import 'package:note_taking_app/presentation/resources/app_strings.dart';

import '../../../../data/remote/wrappers/network_info.dart';

class NoteViewModel extends ChangeNotifier {
  final _noteService = instance<NoteService>();
  final _networkCall = instance<NetworkInfo>();

  //TextEditingController titleTEC = TextEditingController();
  TextEditingController searchTEC = TextEditingController();

  //QuillController descTEC = QuillController.basic();

  bool _loading = false;

  // getters
  bool get loading => _loading;

  // setters
  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  // method to create a new note
  Future<void> createNote({
    required BuildContext context,
    required String title,
    required String desc,
  }) async {
    setLoading(true);
    //var json = jsonEncode(descTEC.document.toDelta().toJson());
    var note = NoteModel(
      title: title,
      titleSearch: setSearchParam(title.toLowerCase()),
      description: jsonDecode(desc)[0]['insert'],
      createdBy: firebaseAuth.currentUser!.uid,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    var result = await _noteService.createNote(note: note);
    result.fold((err) {
      debugPrint("Error: ${err.getMessage()}");
      setLoading(false);
      PopupDialogs(context).errorMessage(err.getMessage());
    }, (res) {
      setLoading(false);
      //  PopupDialogs(context).successMessage(res);
      Navigator.of(context).pop();
    });
    // display message after a note has been deleted
    // since that operation is done in the background
    if (!await _networkCall.isConnected) {
      if (context.mounted) {
        setLoading(false);
        // PopupDialogs(context).successMessage(TAppStrings.tNoteAddedMsg);
        //Navigator.of(context).pop();
        debugPrint("Note created offline");
      }
    }

    notifyListeners();
  }

  // set search param when a note is created or updated
  setSearchParam(String title) {
    List<String> caseSearchList = <String>[];
    String temp = "";
    for (int i = 0; i < title.length; i++) {
      temp = temp + title[i];
      caseSearchList.add(temp);
    }
    return caseSearchList;
  }

  // method to get all notes from firestore
  Stream<List<NoteModel>> getNotes() async* {
    yield* _noteService.getNotes(userId: firebaseAuth.currentUser!.uid);
  }

  // method to get all notes from firestore
  Stream<List<NoteModel>> searchNotes({required String search}) async* {
    yield* _noteService.searchNotes(
        search: search, userId: firebaseAuth.currentUser!.uid);
  }

  // method to delete a note from firestore
  Future<void> updateNote({
    required BuildContext context,
    required String noteId,
    required String title,
    required String desc,
  }) async {
    setLoading(true);
    // decode text from quill controller
    //var json = jsonEncode(descTEC.document.toDelta().toJson());
    // create new note object
    var note = NoteModel(
      id: noteId,
      title: title,
      titleSearch: setSearchParam(title.toLowerCase()),
      description: jsonDecode(desc)[0]['insert'],
      createdBy: firebaseAuth.currentUser!.uid,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );
    var result = await _noteService.updateNote(note: note);
    result.fold((err) {
      setLoading(false);
      PopupDialogs(context).errorMessage(err.getMessage());
    }, (res) {
      setLoading(false);
      Navigator.of(context).pop();
      PopupDialogs(context).successMessage(res);
    });
    // display message after note has been update
    // since that operation is done in the background
    if (!await _networkCall.isConnected) {
      if (context.mounted) {
        setLoading(false);
        Navigator.of(context).pop();
        PopupDialogs(context).successMessage(TAppStrings.tNoteUpdatedMsg);
        debugPrint("Note updated offline");
      }
    }

    notifyListeners();
  }

  // method to delete a note from firestore
  Future<void> deleteNote({
    required BuildContext context,
    required String noteId,
  }) async {
    var result = await _noteService.deleteNote(noteId: noteId);
    result.fold((err) {
      PopupDialogs(context).errorMessage(err.getMessage());
    }, (res) {
      debugPrint(res);
      PopupDialogs(context).successMessage(res);
    });
    // display message after a note has been deleted
    // since that operation is done in the background
    if (!await _networkCall.isConnected) {
      if (context.mounted) {
        setLoading(false);
        Navigator.of(context).pop();
        PopupDialogs(context).successMessage(TAppStrings.tNoteDeletedMsg);
        debugPrint("Note deleted offline");
      }
    }

    notifyListeners();
  }

  // clear fields
  void clearFields(TextEditingController titleTEC, QuillController descTEC) {
    titleTEC.clear();
    descTEC.clear();
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:flutter_quill/flutter_quill.dart';
import 'package:note_taking_app/app/app_constants.dart';
import 'package:note_taking_app/commons/widgets/custom_app_bar.dart';
import 'package:note_taking_app/domain/note_model.dart';
import 'package:note_taking_app/presentation/features/note/view_model/note_view_model.dart';
import 'package:note_taking_app/presentation/features/note/widgets/action_menu_widget.dart';
import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';
import 'package:note_taking_app/presentation/resources/app_strings.dart';
import 'package:note_taking_app/presentation/resources/asset_manager.dart';
import 'package:note_taking_app/util/dialog_util.dart';
import 'package:note_taking_app/util/ext_fxns.dart';
import 'package:note_taking_app/util/helper/size_helper.dart';
import 'package:provider/provider.dart';

class NoteEditorPage extends StatefulWidget {
  final NoteModel? note;
  NoteEditorPage({Key? key, this.note}) : super(key: key);

  @override
  State<NoteEditorPage> createState() => _NoteEditorPageState();
}

class _NoteEditorPageState extends State<NoteEditorPage> {
  late NoteViewModel _viewModel;

  TextEditingController titleTEC = TextEditingController();
  QuillController descTEC = QuillController.basic();
  final ScrollController scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    setPreviewedNoteData();
    super.initState();
  }

  // displays the selected note data to field for editing
  void setPreviewedNoteData() {
    if (widget.note?.id != null) {
      titleTEC.text = widget.note?.title ?? TAppStrings.tEmpty;
      var desc = widget.note?.description ?? TAppStrings.tEmpty;
      var encodeJson = jsonEncode([
        {"insert": "$desc\n"}
      ]);
      descTEC = QuillController(
        document: Document.fromJson(jsonDecode(encodeJson)),
        selection: const TextSelection.collapsed(offset: 0),
      );
    }
  }

  // clears all text fields
  void clearFields() {
    titleTEC.clear();
    descTEC.clear();
  }

  @override
  void dispose() {
    if (context.mounted) {
      titleTEC.dispose();
      descTEC.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = TAppSize.s2; // 1.0 means normal animation speed.
    _viewModel = context.watch<NoteViewModel>();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: TAppColors.tPrimary,
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(TAppPadding.p0),
            child: Column(
              children: [
                // this is custom app bar widget
                Hero(
                  tag: widget.note?.id == null ? 2 : widget.note!.id!,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: TAppPadding.p16,
                      left: TAppPadding.p16,
                      right: TAppPadding.p16,
                    ),
                    child: CustomAppBar(
                      showBack: true,
                      title: TAppStrings.tEmpty,
                      onBackPressed: () {
                        if (titleTEC.text.isNotEmpty ||
                            descTEC.document.toPlainText().length != 1) {
                          var json =
                              jsonEncode(descTEC.document.toDelta().toJson());
                          buildChangesDialog(
                              context: context,
                              text: TAppStrings.tDiscardChanges,
                              onNegativePressed: () {
                                Navigator.of(context).pop();
                                // if (widget.note?.id != null) {
                                Future.delayed(
                                  const Duration(
                                    milliseconds:
                                        TAppConstants.tDialogAnimDurationInSc,
                                  ),
                                  () => Navigator.of(context).pop(),
                                );
                                //}
                              },
                              onPositivePressed: () {
                                Navigator.of(context).pop();
                                if (widget.note?.id != null) {
                                  // means user is currently updating a note
                                  // so perform update operation
                                  _viewModel.updateNote(
                                    context: context,
                                    noteId: widget.note!.id!,
                                    title: titleTEC.text,
                                    desc: json,
                                  );
                                } else {
                                  // means user is currently updating a note
                                  // so perform create operation
                                  _viewModel.createNote(
                                      context: context,
                                      title: titleTEC.text,
                                      desc: json);
                                }
                                clearFields();
                              });
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      icons: [
                        ActionMenuWidget(
                          icon: TAssetManager.getIconPath(tVisibilityIcon),
                          onTap: () {},
                        ),
                        20.pw,
                        ActionMenuWidget(
                          icon: TAssetManager.getIconPath(tSaveIcon),
                          onTap: () {
                            // get text entered from quill editor
                            var json =
                                jsonEncode(descTEC.document.toDelta().toJson());
                            buildChangesDialog(
                              context: context,
                              text: TAppStrings.tSaveChanges,
                              onNegativePressed: () =>
                                  Navigator.of(context).pop(),
                              onPositivePressed: () {
                                Navigator.of(context).pop();
                                if (widget.note?.id != null) {
                                  // means user is currently updating a note
                                  // so perform update operation
                                  _viewModel.updateNote(
                                      context: context,
                                      noteId: widget.note!.id!,
                                      title: titleTEC.text,
                                      desc: json);
                                } else {
                                  // means user is currently updating a note
                                  // so perform create operation
                                  _viewModel.createNote(
                                      context: context,
                                      title: titleTEC.text,
                                      desc: json);
                                }
                                clearFields();
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                20.ph,

                Expanded(
                    child: Column(
                  children: [
                    // note title  controller
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: TAppPadding.p16),
                      child: TextField(
                        controller: titleTEC,
                        style: Theme.of(context).textTheme.headlineMedium,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: TAppStrings.tTitle,
                          hintStyle: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.apply(color: TAppColors.tGrey),
                          filled: false,
                          contentPadding: const EdgeInsets.all(TAppPadding.p0),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                        ),
                      ),
                    ),

                    8.ph,
                    // description or note controller
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: TAppPadding.p16),
                      child: SizedBox(
                        height: screenHeight(context) * 0.30,
                        child: quill.QuillEditor(
                          controller: descTEC,
                          placeholder: TAppStrings.tNoteDescHint,
                          focusNode: focusNode,
                          scrollController: scrollController,
                          scrollable: true,
                          autoFocus: false,
                          readOnly: false,
                          expands: false,
                          padding:
                              const EdgeInsets.only(bottom: TAppPadding.p20),
                          scrollBottomInset: TAppSize.s150,
                        ),
                      ),
                    ),
                    //Spacer(),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: quill.QuillToolbar.basic(
                          showAlignmentButtons: true,
                          multiRowsDisplay: false,
                          controller: descTEC,
                          iconTheme: const quill.QuillIconTheme(
                            borderRadius: TAppRadius.r12,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
              ],
            )),
      ),
    );
  }
}

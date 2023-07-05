import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:note_taking_app/commons/widgets/custom_app_bar.dart';
import 'package:note_taking_app/domain/note_model.dart';
import 'package:note_taking_app/presentation/features/note/widgets/action_menu_widget.dart';
import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';
import 'package:note_taking_app/presentation/resources/app_strings.dart';
import 'package:note_taking_app/presentation/resources/asset_manager.dart';
import 'package:note_taking_app/routes/routes.dart';
import 'package:note_taking_app/util/ext_fxns.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;

class NoteDetailPage extends StatefulWidget {
  final NoteModel note;
  const NoteDetailPage({Key? key, required this.note}) : super(key: key);

  @override
  State<NoteDetailPage> createState() => _NoteDetailPageState();
}

class _NoteDetailPageState extends State<NoteDetailPage> {
  quill.QuillController _descTEC = quill.QuillController.basic();

  final ScrollController _scrollController = ScrollController();

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    displayNoteContent();
    super.initState();
  }

  // display note content for preview
  void displayNoteContent() {
    debugPrint(widget.note.description);
    var desc = widget.note.description ?? TAppStrings.tEmpty;
    var encodeJson = jsonEncode([
      {"insert": "$desc\n"}
    ]);
    _descTEC = quill.QuillController(
      document: quill.Document.fromJson(jsonDecode(encodeJson)),
      selection: const TextSelection.collapsed(offset: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0; // 1.0 means normal animation speed.
    return Scaffold(
      backgroundColor: TAppColors.tPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(TAppPadding.p16),
          child: Column(
            children: [
              // this is custom app bar widget
              CustomAppBar(
                showBack: true,
                onBackPressed: () => Navigator.of(context).pop(),
                title: TAppStrings.tEmpty,
                icons: [
                  Hero(
                    tag: widget.note.id ?? 2,
                    child: ActionMenuWidget(
                      icon: TAssetManager.getIconPath(tEditIcon),
                      onTap: () => Navigator.pushNamed(
                        context,
                        Routes.noteEditorRoute,
                        arguments: widget.note,
                      ),
                    ),
                  ),
                ],
              ),
              20.ph,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // note title
                    Hero(
                      tag: widget.note.id ?? TAppStrings.tNotApplicable,
                      child: Text(
                        widget.note.title ?? TAppStrings.tNotApplicable,
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.headlineLarge?.apply(
                              color: TAppColors.tWhite,
                            ),
                      ),
                    ),
                    20.ph,
                    // note description
                    Expanded(
                      child: SizedBox(
                        child: quill.QuillEditor(
                          controller: _descTEC,
                          placeholder: TAppStrings.tNoteDescHint,
                          focusNode: _focusNode,
                          scrollController: _scrollController,
                          scrollable: true,
                          autoFocus: false,
                          readOnly: true,
                          expands: false,
                          padding:
                              const EdgeInsets.only(bottom: TAppPadding.p20),
                          scrollBottomInset: TAppSize.s150,
                        ),
                        // child: quill.QuillEditor.basic(
                        //   controller: _descTEC,
                        //   readOnly: true,
                        // ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

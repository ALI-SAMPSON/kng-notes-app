import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_taking_app/commons/widgets/popup_dialogs.dart';
import 'package:note_taking_app/domain/note_model.dart';
import 'package:note_taking_app/presentation/features/note/view_model/note_view_model.dart';
import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';
import 'package:note_taking_app/presentation/resources/app_strings.dart';
import 'package:note_taking_app/presentation/resources/asset_manager.dart';
import 'package:note_taking_app/util/helper/size_helper.dart';
import 'package:provider/provider.dart';

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    super.key,
    required this.note,
    required this.index,
    required this.onTap,
  });

  final int index;
  final NoteModel note;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: note.id ?? 02,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Dismissible(
            // Each Dismissible must contain a Key. Keys allow Flutter to
            // uniquely identify widgets.
            key: Key(note.id!),
            // Provide a function that tells the app
            // what to do after an item has been swiped away.
            onDismissed: (direction) async {
              // Remove note from firestore
              await context
                  .read<NoteViewModel>()
                  .deleteNote(context: context, noteId: note.id!);
              // Remove the item from list
              //notes.removeAt(index);
            },
            // show red background when note is swiped
            background: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: TAppMargin.m16),
              decoration: BoxDecoration(
                color: TAppColors.tRed,
                borderRadius: BorderRadius.circular(TAppRadius.r10),
              ),
              child: SvgPicture.asset(
                TAssetManager.getIconPath(tDeleteIcon),
              ),
            ),
            child: Container(
              width: screenWidth(context),
              margin: const EdgeInsets.only(top: TAppMargin.m20),
              padding: const EdgeInsets.all(TAppPadding.p20),
              decoration: BoxDecoration(
                  color: Colors
                      .primaries[Random().nextInt(Colors.primaries.length)],
                  borderRadius: BorderRadius.circular(TAppRadius.r10)),
              child: Text(
                note.title ?? TAppStrings.tNotApplicable,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.apply(color: TAppColors.tPrimary),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

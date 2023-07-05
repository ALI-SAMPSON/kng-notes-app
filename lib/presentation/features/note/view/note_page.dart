import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_taking_app/app/app_constants.dart';
import 'package:note_taking_app/commons/widgets/custom_app_bar.dart';
import 'package:note_taking_app/domain/note_model.dart';
import 'package:note_taking_app/presentation/features/auth/view_model/auth_view_model.dart';
import 'package:note_taking_app/presentation/features/note/view_model/note_view_model.dart';
import 'package:note_taking_app/presentation/features/note/widgets/action_menu_widget.dart';
import 'package:note_taking_app/presentation/features/note/widgets/custom_progress_indicator.dart';
import 'package:note_taking_app/presentation/features/note/widgets/empty_state_widget.dart';
import 'package:note_taking_app/presentation/features/note/widgets/note_widget.dart';
import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';
import 'package:note_taking_app/presentation/resources/app_strings.dart';
import 'package:note_taking_app/presentation/resources/asset_manager.dart';
import 'package:note_taking_app/routes/routes.dart';
import 'package:note_taking_app/util/dialog_util.dart';
import 'package:note_taking_app/util/ext_fxns.dart';
import 'package:note_taking_app/util/helper/size_helper.dart';
import 'package:provider/provider.dart';

class NotePage extends StatelessWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final isDarkMode =
    //     MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Scaffold(
      backgroundColor: TAppColors.tPrimary,
      floatingActionButton: FloatingActionButton(
        elevation: TAppElevation.e5,
        backgroundColor: TAppColors.tPrimary,
        onPressed: () => Navigator.pushNamed(
          context,
          Routes.noteEditorRoute,
          arguments: NoteModel(
            id: null,
            title: null,
            titleSearch: null,
            description: null,
            createdBy: null,
            createdAt: null,
            updatedAt: null,
          ),
        ),
        child: SvgPicture.asset(
          TAssetManager.getIconPath(tAddIcon),
          width: TAppSize.s40,
          height: TAppSize.s40,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(TAppPadding.p16),
          child: Column(
            children: [
              // this is custom app bar widget
              CustomAppBar(
                showBack: false,
                onBackPressed: () {},
                title: TAppStrings.tNotes,
                icons: [
                  Material(
                    color: TAppColors.tTransparent,
                    child: Hero(
                      tag: 01,
                      child: ActionMenuWidget(
                        icon: TAssetManager.getIconPath(tSearchIcon),
                        onTap: () => Navigator.pushNamed(
                            context, Routes.noteSearchRoute),
                      ),
                    ),
                  ),
                  20.pw,
                  ActionMenuWidget(
                    icon: TAssetManager.getIconPath(tInfoIcon),
                    onTap: () {
                      buildChangesDialog(
                        context: context,
                        text: TAppStrings.tSignoutMsg,
                        onNegativePressed: () => Navigator.of(context).pop(),
                        onPositivePressed: () => context
                            .read<AuthViewModel>()
                            .logOut(context: context),
                      );
                    },
                  ),
                ],
              ),
              //10.ph,
              // this is the listview builder to display the list of notes
              Expanded(
                child: StreamBuilder<List<NoteModel>>(
                    stream: Provider.of<NoteViewModel>(context, listen: false)
                        .getNotes(),
                    builder: (context, snapshot) {
                      return (snapshot.connectionState ==
                              ConnectionState.waiting)
                          ? const CustomProgressIndicator()
                          : (snapshot.data != null && snapshot.data!.isEmpty)
                              ? Align(
                                  alignment: Alignment.center,
                                  child: EmptyStateWidget(
                                    text: TAppStrings.tCreateNoteMsg,
                                    icon: TAssetManager.getIconPath(tEmptyIcon),
                                  ),
                                )
                              : AnimationLimiter(
                                  child: ListView.builder(
                                    itemCount: snapshot.data?.length,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      final note = snapshot.data![index];
                                      return AnimationConfiguration
                                          .staggeredList(
                                        position: index,
                                        duration: const Duration(
                                          milliseconds: TAppConstants
                                              .tDialogAnimDurationInSc,
                                        ),
                                        child: SlideAnimation(
                                          verticalOffset: TAppSize.s50,
                                          child: FadeInAnimation(
                                            child: NoteWidget(
                                              note: note,
                                              index: index,
                                              onTap: () => Navigator.pushNamed(
                                                context,
                                                Routes.noteDetailRoute,
                                                arguments: note,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

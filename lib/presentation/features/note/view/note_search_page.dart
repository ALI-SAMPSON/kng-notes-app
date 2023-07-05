import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_taking_app/app/app_constants.dart';
import 'package:note_taking_app/commons/widgets/custom_app_bar.dart';
import 'package:note_taking_app/domain/note_model.dart';
import 'package:note_taking_app/presentation/features/note/view_model/note_view_model.dart';
import 'package:note_taking_app/presentation/features/note/widgets/action_menu_widget.dart';
import 'package:note_taking_app/presentation/features/note/widgets/custom_progress_indicator.dart';
import 'package:note_taking_app/presentation/features/note/widgets/empty_state_widget.dart';
import 'package:note_taking_app/presentation/features/note/widgets/note_widget.dart';
import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';
import 'package:note_taking_app/presentation/resources/app_fonts.dart';
import 'package:note_taking_app/presentation/resources/app_strings.dart';
import 'package:note_taking_app/presentation/resources/asset_manager.dart';
import 'package:note_taking_app/routes/routes.dart';
import 'package:note_taking_app/util/ext_fxns.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:provider/provider.dart';

class NoteSearchPage extends StatefulWidget {
  const NoteSearchPage({Key? key}) : super(key: key);

  @override
  State<NoteSearchPage> createState() => _NoteSearchPageState();
}

class _NoteSearchPageState extends State<NoteSearchPage> {
  String search = '';

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0; // 1.0 means normal animation speed.
    var model = context.watch<NoteViewModel>();
    return Scaffold(
      backgroundColor: TAppColors.tPrimary,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(TAppPadding.p16),
          child: Column(
            children: [
              // search view
              Hero(
                tag: 01,
                child: Material(
                  color: TAppColors.tTransparent,
                  child: TextField(
                    controller: model.searchTEC,
                    onChanged: (val) {
                      setState(() {
                        search = val;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: TAppStrings.tSearchByKeyword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          if (model.searchTEC.text.isEmpty) {
                            Navigator.of(context).pop();
                          } else {
                            setState(() {
                              search = '';
                            });
                            model.searchTEC.clear();
                          }
                        },
                        icon: SvgPicture.asset(
                          TAssetManager.getIconPath(tCloseIcon),
                          width: TAppSize.s14,
                          height: TAppSize.s14,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: StreamBuilder(
                    stream: search.isEmpty
                        ? Provider.of<NoteViewModel>(context, listen: false)
                            .getNotes()
                        : Provider.of<NoteViewModel>(context, listen: false)
                            .searchNotes(search: search),
                    builder: (context, snapshots) {
                      debugPrint('Notes: ${snapshots.data?.length}');
                      if (snapshots.connectionState ==
                          ConnectionState.waiting) {
                        return const CustomProgressIndicator();
                      }
                      if (snapshots.data!.isEmpty) {
                        return search.isEmpty
                            ? Align(
                                alignment: Alignment.center,
                                child: EmptyStateWidget(
                                  text: TAppStrings.tCreateNoteMsg,
                                  icon: TAssetManager.getIconPath(tEmptyIcon),
                                ),
                              )
                            : Hero(
                                tag: 0,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: EmptyStateWidget(
                                    text: TAppStrings.tFileNotFoundMsg,
                                    icon: TAssetManager.getIconPath(
                                        tNotFoundIcon),
                                  ),
                                ),
                              );
                      }
                      return AnimationLimiter(
                        child: ListView.builder(
                          itemCount: snapshots.data?.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            var note = snapshots.data![index];

                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(
                                milliseconds:
                                    TAppConstants.tDialogAnimDurationInSc,
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
                            // return Center(
                            //   child: Hero(
                            //     tag: 0,
                            //     child: Align(
                            //       alignment: Alignment.center,
                            //       child: EmptyStateWidget(
                            //         text: TAppStrings.tFileNotFoundMsg,
                            //         icon: TAssetManager.getIconPath(
                            //             tNotFoundIcon),
                            //       ),
                            //     ),
                            //   ),
                            // );

                            // return Center(
                            //   child: Hero(
                            //     tag: 0,
                            //     child: Align(
                            //       alignment: Alignment.center,
                            //       child: EmptyStateWidget(
                            //         text: TAppStrings.tFileNotFoundMsg,
                            //         icon: TAssetManager.getIconPath(
                            //             tNotFoundIcon),
                            //       ),
                            //     ),
                            //   ),
                            // );
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:note_taking_app/commons/widgets/custom_app_bar.dart';
import 'package:note_taking_app/presentation/features/auth/view_model/auth_view_model.dart';
import 'package:note_taking_app/presentation/features/auth/widgets/form_footer_widget.dart';
import 'package:note_taking_app/presentation/features/auth/widgets/form_header_widget.dart';
import 'package:note_taking_app/presentation/features/note/widgets/custom_elevated_button.dart';
import 'package:note_taking_app/presentation/resources/app_colors.dart';
import 'package:note_taking_app/presentation/resources/app_dimens.dart';
import 'package:note_taking_app/presentation/resources/app_strings.dart';
import 'package:note_taking_app/presentation/resources/asset_manager.dart';
import 'package:note_taking_app/routes/routes.dart';
import 'package:note_taking_app/util/enum/app_state.dart';
import 'package:note_taking_app/util/ext_fxns.dart';
import 'package:note_taking_app/util/helper/size_helper.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 2.0; // 1.0 means normal animation speed.
    return Scaffold(
      body: Consumer<AuthViewModel>(builder: (context, model, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(TAppPadding.p20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // custom app bar with back button action
                  CustomAppBar(
                    showBack: true,
                    onBackPressed: () => Navigator.of(context).pop(),
                    title: TAppStrings.tEmpty,
                    icons: [],
                  ),
                  // form header
                  Hero(
                    tag: 0,
                    child: FormHeaderWidget(
                      icon: TAssetManager.getIconPath(tNoteIcon),
                      title: TAppStrings.tLoginTitle,
                      subTitle: TAppStrings.tLoginSubTitle,
                    ),
                  ),
                  25.ph,
                  // email textfield
                  TextField(
                    controller: model.emailTEC,
                    textInputAction: TextInputAction.next,
                    decoration: const InputDecoration(
                      hintText: TAppStrings.tEmail,
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                  30.ph,
                  // password textfield
                  TextField(
                    controller: model.passwordTEC,
                    obscureText: model.obscure,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      hintText: TAppStrings.tPassword,
                      prefixIcon: const Icon(Icons.fingerprint),
                      suffixIcon: IconButton(
                        onPressed: model.onObscureChanged,
                        icon: Icon(
                          model.obscure
                              ? Icons.remove_red_eye_outlined
                              : Icons.visibility_off_outlined,
                        ),
                      ),
                    ),
                  ),

                  50.ph,

                  // login button
                  SizedBox(
                    width: screenWidth(context),
                    child: CustomElevatedButton(
                      text: TAppStrings.tLogin.toUpperCase(),
                      busy: model.busy,
                      onTap: () => model.signIn(context: context),
                    ),
                  ),

                  20.ph,
                  // sign up link
                  FormFooterWidget(
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.signUpRoute),
                    promptText: '${TAppStrings.tDontHaveAccount} ',
                    linkText: TAppStrings.tSignup,
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

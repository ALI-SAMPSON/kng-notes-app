import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:note_taking_app/app/app_constants.dart';
import 'package:note_taking_app/app/app_di.dart';
import 'package:note_taking_app/commons/anim/fade_in_animation_view_model.dart';
import 'package:note_taking_app/firebase_options.dart';
import 'package:note_taking_app/presentation/features/auth/view_model/auth_view_model.dart';
import 'package:note_taking_app/presentation/features/note/view_model/note_view_model.dart';
import 'package:note_taking_app/presentation/resources/app_strings.dart';
import 'package:note_taking_app/routes/routes.dart';
import 'package:note_taking_app/util/theme/app_theme.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  await initAppModule(); // initialize dependency injection
  runApp(MyApp());
}

// initialize firebase here
Future<void> initializeFirebase() async => await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform);

class MyApp extends StatelessWidget {
  const MyApp._internal(); // private named constructor

  static const MyApp instance =
      MyApp._internal(); // single instance -- singleton

  factory MyApp() => instance; // factory for the class instance

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => NoteViewModel()),
        ChangeNotifierProvider(create: (_) => FadeInAnimationViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: TAppStrings.tAppName,
        theme: TAppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        initialRoute: firebaseAuth.currentUser == null
            ? Routes.splashRoute
            : Routes.noteRoute,
        onGenerateRoute: RouteGenerator.getRoute,
      ),
    );
  }
}

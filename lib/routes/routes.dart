import 'package:note_taking_app/domain/note_model.dart';
import 'package:note_taking_app/presentation/features/auth/views/landing_page.dart';
import 'package:note_taking_app/presentation/features/auth/views/login_page.dart';
import 'package:note_taking_app/presentation/features/auth/views/signup_page.dart';
import 'package:note_taking_app/presentation/features/auth/views/splash_page.dart';
import 'package:note_taking_app/presentation/features/note/view/note_detail_page.dart';
import 'package:note_taking_app/presentation/features/note/view/note_editor_page.dart';
import 'package:note_taking_app/presentation/features/note/view/note_page.dart';
import 'package:note_taking_app/presentation/features/note/view/note_search_page.dart';
import 'package:note_taking_app/presentation/resources/app_strings.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String splashRoute = '/';
  static const String landingRoute = '/landing-route';
  static const String loginRoute = '/login-route';
  static const String signUpRoute = '/signup-route';
  static const String noteRoute = '/note-route';
  static const String noteDetailRoute = '/note-detail-route';
  static const String noteEditorRoute = '/note-editor-route';
  static const String noteSearchRoute = '/note-search-route';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case Routes.landingRoute:
        return MaterialPageRoute(builder: (_) => LandingPage());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case Routes.signUpRoute:
        return MaterialPageRoute(builder: (_) => const SignupPage());
      case Routes.noteRoute:
        return MaterialPageRoute(
            builder: (_) => const NotePage(
                  notes: [],
                ));
      case Routes.noteSearchRoute:
        return MaterialPageRoute(builder: (_) => const NoteSearchPage());
      case Routes.noteDetailRoute:
        var note = routeSettings.arguments as NoteModel;
        return MaterialPageRoute(builder: (_) => NoteDetailPage(note: note));
      case Routes.noteEditorRoute:
        NoteModel? note = routeSettings.arguments as NoteModel;
        return MaterialPageRoute(builder: (_) => NoteEditorPage(note: note));
      default:
        return UnDefinedRoute();
    }
  }

  // undefined route
  static Route<dynamic> UnDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: const Text(TAppStrings.tNoRouteFound),
              ),
              body: const Center(
                child: Text(TAppStrings.tNoRouteFound),
              ),
            ));
  }
}

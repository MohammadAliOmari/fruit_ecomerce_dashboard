import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruit_dashboard/core/helper/functions/on_genrate_route.dart';
import 'package:fruit_dashboard/core/services/bloc_observer.dart';
import 'package:fruit_dashboard/core/services/get_it_services.dart';
import 'package:fruit_dashboard/core/services/shared_preferences.dart';
import 'package:fruit_dashboard/features/auth/presentation/view/signin_view.dart';
import 'package:fruit_dashboard/firebase_options.dart';
import 'package:fruit_dashboard/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  Bloc.observer = MyBlocObserver();
  await Prefs.init();
  await dotenv.load(fileName: ".env");
  // await FireStorage().initFirebase();
  // await FirestoreServices().initFirebase();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: onGenerateRoute,
      initialRoute: SigninView.routeName,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      locale: const Locale(
        'ar',
      ),
    );
  }
}

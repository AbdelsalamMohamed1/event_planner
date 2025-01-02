import 'package:event_plannig/auth/login_screen.dart';
import 'package:event_plannig/auth/register_screen.dart';
import 'package:event_plannig/create_event_screen/create_event_screen.dart';
import 'package:event_plannig/home_screen.dart';
import 'package:event_plannig/providers/language_provider.dart';
import 'package:event_plannig/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'Profile_tab/profile_tab.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => LanguageProvider(),),
    ChangeNotifierProvider(create: (context) => ThemeProvider(),)
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var languageProvider = Provider.of<LanguageProvider>(context);
    var themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      initialRoute: LoginScreen.routeName,
      routes: {
        ProfileTab.routeName: (context) => ProfileTab(),
        HomeScreen.routeName: (context) => HomeScreen(),
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
        CreateEventScreen.routeName:(context) => CreateEventScreen(),

      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.language),
      theme: themeProvider.theme,
    );
  }
}


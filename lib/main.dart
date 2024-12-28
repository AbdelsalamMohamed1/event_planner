import 'package:event_plannig/providers/language_provider.dart';
import 'package:event_plannig/providers/theme_provider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'Profile_tab/profile_tab.dart';

void main() {
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
      initialRoute: ProfileTab.routeName,
      routes: {
        ProfileTab.routeName: (context) => ProfileTab(),
      },
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(languageProvider.language),
      theme: themeProvider.theme,
    );
  }
}


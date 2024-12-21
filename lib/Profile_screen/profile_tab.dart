import 'package:event_plannig/my_app_colors.dart';
import 'package:event_plannig/my_theme_data.dart';
import 'package:event_plannig/providers/language_provider.dart';
import 'package:event_plannig/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = 'settingScreen';

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool lightTheme = true;

  bool arabic = true;

  @override
  Widget build(BuildContext context) {
    var languageProvider=Provider.of<LanguageProvider>(context);
    var themeProvider=Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text(AppLocalizations.of(context)!.setting,style: themeProvider.theme.textTheme.titleMedium,),),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.language,
              style: themeProvider.theme.textTheme.titleMedium,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      child: Column(
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  arabic = true;
                                  languageProvider.changeLanguage('ar');
                                });
                              },
                              child: (arabic)
                                  ? Row(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.arabic,
                                          style: themeProvider.theme.textTheme.displaySmall,
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.check,
                                          size: 25,
                                          color: MyAppColors.primary,
                                        )
                                      ],
                                    )
                                  : Row(
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.arabic,
                                          style: themeProvider.theme.textTheme.displayMedium,
                                                                    textAlign: TextAlign.start,
                                        ),
                                    ],
                                  )),
                          SizedBox(
                            height: 5,
                          ),
                          InkWell(
                              onTap: () {
                                arabic = false;
                                languageProvider.changeLanguage('en');
                              },
                              child: (!arabic)
                                  ? Row(
                                      children: [
                                        Text(
                                          AppLocalizations.of(context)!.english,
                                          style: themeProvider.theme.textTheme.displaySmall,
                                        ),
                                        Spacer(),
                                        Icon(
                                          Icons.check,
                                          size: 25,
                                          color: MyAppColors.primary,
                                        )
                                      ],
                                    )
                                  : Row(
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!.english,
                                          style: themeProvider.theme.textTheme.displayMedium,
                                        textAlign: TextAlign.start,
                                        ),
                                    ],
                                  ))
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: MyAppColors.primary)),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                  (arabic)?AppLocalizations.of(context)!.arabic:AppLocalizations.of(context)!.english,
                      style: themeProvider.theme.textTheme.titleSmall,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: MyAppColors.primary,
                      size: 35,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            Text(
              AppLocalizations.of(context)!.theme,
              style: themeProvider.theme.textTheme.titleMedium,
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      padding: EdgeInsets.all(15),
                      width: double.infinity,
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                lightTheme=true;
                                themeProvider.changeTheme(MyThemeData.lightTheme);
                              });
                            },
                            child: (lightTheme)
                                ? Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.light,
                                  style: themeProvider.theme.textTheme.displaySmall,
                                ),
                                Spacer(),
                                Icon(
                                  Icons.check,
                                  size: 25,
                                  color: MyAppColors.primary,
                                )
                              ],
                            )
                                : Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.light,
                                  style: themeProvider.theme.textTheme.displayMedium,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            )
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          InkWell(
                            onTap: () {
                              lightTheme=false;
                              themeProvider.changeTheme(MyThemeData.darkTheme);
                            },
                            child: (!lightTheme)
                                ? Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.dark,
                                  style: themeProvider.theme.textTheme.displaySmall,
                                ),
                                Spacer(),
                                Icon(
                                  Icons.check,
                                  size: 25,
                                  color: MyAppColors.primary,
                                )
                              ],
                            )
                                : Row(
                              children: [
                                Text(
                                  AppLocalizations.of(context)!.dark,
                                  style: themeProvider.theme.textTheme.displayMedium,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            )
                          )
                        ],
                      ),
                    );
                  },
                );
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: MyAppColors.primary)),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.light,
                      style: MyThemeData.lightTheme.textTheme.titleSmall,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: MyAppColors.primary,
                      size: 35,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

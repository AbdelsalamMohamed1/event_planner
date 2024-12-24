import 'package:event_plannig/my_app_colors.dart';
import 'package:event_plannig/my_theme_data.dart';
import 'package:event_plannig/providers/language_provider.dart';
import 'package:event_plannig/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class ProfileTab extends StatefulWidget {
  static String routeName = 'settingScreen';

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {


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
                                  languageProvider.changeLanguage('ar');
                                });
                              },
                              child: (languageProvider.language=='ar')
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

                                languageProvider.changeLanguage('en');
                              },
                              child: (languageProvider.language=='en')
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
                child: (languageProvider.language=='ar')?Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.arabic,
                      style: themeProvider.theme.textTheme.titleSmall,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: MyAppColors.primary,
                      size: 35,
                    ),
                  ],
                ):Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.english,
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

                                themeProvider.changeTheme(MyThemeData.lightTheme);
                              });
                            },
                            child: (themeProvider.theme==MyThemeData.lightTheme)
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

                              themeProvider.changeTheme(MyThemeData.darkTheme);
                            },
                            child: (themeProvider.theme==MyThemeData.darkTheme)
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
                child: (themeProvider.theme==MyThemeData.lightTheme)?Row(
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
                ):
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.dark,
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

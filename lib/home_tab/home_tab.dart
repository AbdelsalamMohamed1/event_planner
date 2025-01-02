import 'package:event_plannig/category_tab.dart';
import 'package:event_plannig/event_display.dart';
import 'package:event_plannig/event_model.dart';
import 'package:event_plannig/my_app_colors.dart';
import 'package:event_plannig/my_theme_data.dart';
import 'package:event_plannig/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int currentTab = 0;

  @override
  Widget build(BuildContext context) {
    List<String> tabsNames = [
      AppLocalizations.of(context)!.all,
      AppLocalizations.of(context)!.birthday,
      AppLocalizations.of(context)!.book_club,
      AppLocalizations.of(context)!.eating,
      AppLocalizations.of(context)!.exhibition,
      AppLocalizations.of(context)!.gaming,
      AppLocalizations.of(context)!.holiday,
      AppLocalizations.of(context)!.meeting,
      AppLocalizations.of(context)!.sports,
      AppLocalizations.of(context)!.workshop,
    ];
    var screen = MediaQuery
        .of(context)
        .size;
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isLightTheme = (themeProvider.theme == MyThemeData.lightTheme);
    return SafeArea(
        child: Column(
          children: [
            Container(
              height: screen.height * .2,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color:
                  (isLightTheme) ? MyAppColors.primary : MyAppColors.darktheme,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(24),
                      bottomRight: Radius.circular(24))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.welcome_back,
                            style: MyThemeData.lightTheme.textTheme
                                .displayLarge,
                          ),
                          Text(
                            "John Safwat",
                            style: MyThemeData.lightTheme.textTheme.titleLarge,
                          )
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      ImageIcon(
                        AssetImage('assets/images/ic_unselected_map.png'),
                        color: MyAppColors.white,
                      ),
                      Text("Cairo , Egypt",
                          style: MyThemeData.lightTheme.textTheme.displayLarge),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: screen.height * .05,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                              currentTab = index;
                            });
                          },
                          child: CategoryTab(
                            textStyle: themeProvider.theme.textTheme
                                .headlineLarge!,
                            isSelected: (currentTab == index),
                            title: tabsNames[index],
                            backgroundColor: (isLightTheme)?MyAppColors.white:MyAppColors.primary,
                          ),
                        );
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: tabsNames.length,
                      padding: EdgeInsets.all(0),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(itemBuilder: (context, index) {
                return EventDisplay(
                    assetImage:(isLightTheme)
                        ? AssetImage(EventModel.lightThemeImages[0])
                        : AssetImage(EventModel.darkThemeImages[0]),
                    date: '$index',
                    desc: 'heeelllooooo',
                    isFavorite: false);
              },
                itemCount: 2,
                scrollDirection: Axis.vertical,
              ),
            )
          ],
        )
    );
  }
}

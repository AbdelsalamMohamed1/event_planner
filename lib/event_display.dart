import 'package:event_plannig/my_app_colors.dart';
import 'package:event_plannig/my_theme_data.dart';
import 'package:event_plannig/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventDisplay extends StatelessWidget {
  AssetImage assetImage;
  String date;
  String desc;
  bool isFavorite;

  EventDisplay(
      {required this.assetImage,
      required this.date,
      required this.desc,
      required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isLightTheme = (themeProvider.theme == MyThemeData.lightTheme);
    var screen = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: assetImage),
        border: Border.all(color: MyAppColors.primary),
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(16),
      height: screen.height * .239,
      width: screen.width * .918,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            width: screen.width * .124,
            height: screen.height * .08,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: (isLightTheme) ? MyAppColors.white : Colors.transparent),
            child: Column(
              children: [
                Text(
                  date,
                  style: themeProvider.theme.textTheme.titleSmall,
                ),
                Text(
                  "Nov",
                  style: themeProvider.theme.textTheme.displaySmall,
                )
              ],
            ),
          ),
          Spacer(),
          Container(
            decoration: BoxDecoration(
                color:
                    (isLightTheme) ? MyAppColors.white : MyAppColors.darktheme,
                borderRadius: BorderRadius.circular(16)),
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  desc,
                  style: themeProvider.theme.textTheme.displayMedium,
                ),
                ImageIcon(
                  (isFavorite)
                      ? AssetImage("assets/images/ic_selected_favorite.png")
                      : AssetImage("assets/images/ic_unselected_favorite.png"),
                  size: 35,
                  color: MyAppColors.primary,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

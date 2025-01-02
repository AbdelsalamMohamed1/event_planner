import 'package:event_plannig/event_display.dart';
import 'package:event_plannig/event_model.dart';
import 'package:event_plannig/my_app_colors.dart';
import 'package:event_plannig/my_theme_data.dart';
import 'package:event_plannig/my_widget/custom_text_form_field.dart';
import 'package:event_plannig/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoriteTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isLightTheme = (themeProvider.theme == MyThemeData.lightTheme);
    return SafeArea(
      child: Column(
        children: [
          SizedBox(
            height: screen.height * .02,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: CustomTextFormField(
              hintText: AppLocalizations.of(context)!.search_for_event,
              hintStyle: themeProvider.theme.textTheme.displaySmall!,
              borderColor: MyAppColors.primary,
              prefix: ImageIcon(
                AssetImage('assets/images/ic_search.png'),
                color: MyAppColors.primary,
              ),
            ),
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (context, index) {
              return EventDisplay(
                  assetImage: (isLightTheme)
                      ? AssetImage(EventModel.lightThemeImages[0])
                      : AssetImage(EventModel.darkThemeImages[0]),
                  date: '$index',
                  desc: 'heeeeellllloooo',
                  isFavorite: true);
            },
            itemCount: 2,
          ))
        ],
      ),
    );
  }
}

import 'package:event_plannig/event_display.dart';
import 'package:event_plannig/event_model.dart';
import 'package:event_plannig/my_app_colors.dart';
import 'package:event_plannig/my_theme_data.dart';
import 'package:event_plannig/my_widget/custom_text_form_field.dart';
import 'package:event_plannig/providers/event_list_provider.dart';
import 'package:event_plannig/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../firebase utils/fire_base_utils.dart';

class FavoriteTab extends StatefulWidget {
  @override
  State<FavoriteTab> createState() => _FavoriteTabState();
}

class _FavoriteTabState extends State<FavoriteTab> {
  @override
  Widget build(BuildContext context) {
    List<EventModel> eventsList = [];
    var screen = MediaQuery.of(context).size;
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isLightTheme = (themeProvider.theme == MyThemeData.lightTheme);
    var eventListProvider = Provider.of<EventListProvider>(context);
    if (eventsList.isEmpty){
      eventListProvider.getAllLikedEvents(onClick: (){setState(() {});});
    }

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
                  onFavoriteClick: () {
                    FireBaseUtils.changeFavorite(eventListProvider.eventList[index]);
                    setState(() {});
                  },
                  eventModel: eventsList[index],
                );
              },
              itemCount: eventsList.length,
              scrollDirection: Axis.vertical,
            ),
          )
        ],
      ),
    );
  }
}

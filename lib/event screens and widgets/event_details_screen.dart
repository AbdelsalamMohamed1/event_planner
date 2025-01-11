import 'package:event_plannig/event_model.dart';
import 'package:event_plannig/firebase%20utils/fire_base_utils.dart';
import 'package:event_plannig/home_screen.dart';
import 'package:event_plannig/my_app_colors.dart';
import 'package:event_plannig/my_theme_data.dart';
import 'package:event_plannig/providers/event_list_provider.dart';
import 'package:event_plannig/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventDetailsScreen extends StatelessWidget {
  static String routeName = 'event details screen';

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isLightTheme = (themeProvider.theme == MyThemeData.lightTheme);
    var event = ModalRoute.of(context)!.settings.arguments as EventModel;
    var eventListProvider=Provider.of<EventListProvider>(context);
    var screen = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Navigator.pushReplacementNamed(context,HomeScreen.routeName);
            },
            child: Icon(Icons.arrow_back,color: MyAppColors.primary,)),
        backgroundColor:
            (isLightTheme) ? MyAppColors.white : MyAppColors.darktheme,
        iconTheme: IconThemeData(color: MyAppColors.primary),
        centerTitle: true,
        title: Text(
          AppLocalizations.of(context)!.event_details,
          style: themeProvider.theme.textTheme.headlineSmall,
        ),
        actions: [
          GestureDetector(
              onTap: () {},
              child: ImageIcon(
                AssetImage('assets/images/ic_edit_event.png'),
                color: MyAppColors.primary,
              )),
          SizedBox(
            width: screen.width * .02,
          ),
          SizedBox(width: screen.width*.005,),
          GestureDetector(
            onTap: () {
              FireBaseUtils.deleteEvent(event);
              eventListProvider.emptyList();
              Navigator.pushReplacementNamed(context,HomeScreen.routeName);
            },
            child: ImageIcon(
              AssetImage('assets/images/ic_delete_event.png'),
              color: MyAppColors.red,
            ),
          ),
          SizedBox(
            width: screen.width * .02,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                clipBehavior: Clip.hardEdge,
                child: Image(
                  image: (isLightTheme)
                      ? AssetImage(EventModel.lightThemeImages[event.image])
                      : AssetImage(EventModel.darkThemeImages[event.image]),
                ),
              ),
              SizedBox(
                height: screen.height * .01,
              ),
              Text(
                event.title,
                textAlign: TextAlign.center,
                style: themeProvider.theme.textTheme.titleSmall,
              ),
              SizedBox(
                height: screen.height * .01,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: MyAppColors.primary)),
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      height: screen.width * .117,
                      width: screen.width * .117,
                      decoration: BoxDecoration(
                          color: MyAppColors.primary,
                          borderRadius: BorderRadius.circular(8)),
                      child: ImageIcon(
                        AssetImage('assets/images/ic_date.png'),
                        color: (isLightTheme)
                            ? MyAppColors.white
                            : MyAppColors.darktheme,
                      ),
                    ),
                    SizedBox(
                      width: screen.width * .01,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${DateFormat('d MMMM y').format(event.date)}',
                          style: themeProvider.theme.textTheme.displaySmall,
                        ),
                        Text(
                          '${event.time}',
                          style: themeProvider.theme.textTheme.displayMedium,
                          textAlign: TextAlign.start,
                        )
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(
                height: screen.height * .01,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: MyAppColors.primary)),
                padding: EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      height: screen.width * .117,
                      width: screen.width * .117,
                      decoration: BoxDecoration(
                          color: MyAppColors.primary,
                          borderRadius: BorderRadius.circular(8)),
                      child: ImageIcon(
                        AssetImage('assets/images/ic_gps.png'),
                        color: (isLightTheme)
                            ? MyAppColors.white
                            : MyAppColors.darktheme,
                      ),
                    ),
                    SizedBox(
                      width: screen.width * .01,
                    ),
                    Text(
                      'Cairo , Egypt',
                      style: themeProvider.theme.textTheme.displaySmall,
                    ),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(
                height: screen.height * .01,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: MyAppColors.primary),
                    image: DecorationImage(
                        image: AssetImage('assets/images/map.png'),
                        fit: BoxFit.fill)),
                width: screen.width * .4,
                height: screen.height * .4,
              ),
              SizedBox(
                height: screen.height * .01,
              ),
              Text(
                AppLocalizations.of(context)!.description +' :',
                style: themeProvider.theme.textTheme.displayMedium,
              ),
              SizedBox(
                height: screen.height * .01,
              ),
              Text(
                event.desc,
                style: themeProvider.theme.textTheme.displayMedium,
              )
            ],
          ),
        ),
      ),
    );
  }
}

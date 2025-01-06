import 'package:event_plannig/event_model.dart';
import 'package:event_plannig/firebase%20utils/fire_base_utils.dart';
import 'package:event_plannig/my_theme_data.dart';
import 'package:event_plannig/my_widget/custom_elevated_button.dart';
import 'package:event_plannig/my_widget/custom_text_form_field.dart';
import 'package:event_plannig/providers/event_list_provider.dart';
import 'package:event_plannig/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../category_tab.dart';
import '../my_app_colors.dart';

class CreateEventScreen extends StatefulWidget {
  static String routeName = 'CreateEventScreen';

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  int currentTab = 0;
  var formKey = GlobalKey<FormState>();
  DateTime? date;
  int image = 0;
  String eventType = '';
  String title = '';
  String desc = '';
  TimeOfDay? time;

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isLightTheme = (themeProvider.theme == MyThemeData.lightTheme);
    var eventListProvider=Provider.of<EventListProvider>(context);
    List<String> tabsNames = [
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.create_event,
          style: themeProvider.theme.textTheme.headlineSmall,
        ),
        centerTitle: true,
        backgroundColor: (isLightTheme) ? MyAppColors.white : null,
        iconTheme: IconThemeData(color: MyAppColors.primary),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
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
                    image: AssetImage((isLightTheme)
                        ? EventModel.lightThemeImages[currentTab]
                        : EventModel.darkThemeImages[currentTab])),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                height: screen.height * .05,
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          currentTab = index;
                          eventType = tabsNames[index];
                          image = currentTab;
                        });
                      },
                      child: CategoryTab(
                        isLightTheme: isLightTheme,
                        createEvent: true,
                        textStyle: themeProvider.theme.textTheme.displaySmall!,
                        isSelected: (currentTab == index),
                        title: tabsNames[index],
                        backgroundColor: MyAppColors.primary,
                      ),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: tabsNames.length,
                  padding: EdgeInsets.all(0),
                ),
              ),
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.title,
                        style: themeProvider.theme.textTheme.bodySmall,
                      ),
                      CustomTextFormField(
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'please enter event title';
                          }
                          return null;
                        },
                        hintText: AppLocalizations.of(context)!.title,
                        hintStyle: themeProvider.theme.textTheme.bodyLarge!,
                        borderColor: MyAppColors.gray,
                        prefix: ImageIcon(
                          AssetImage('assets/images/ic_edit.png'),
                          color: MyAppColors.gray,
                        ),
                        onChanged: (text) {
                          title = text;
                        },
                      ),
                      SizedBox(
                        height: screen.height * .02,
                      ),
                      Text(
                        AppLocalizations.of(context)!.description,
                        style: themeProvider.theme.textTheme.bodySmall,
                      ),
                      CustomTextFormField(
                        hintText: AppLocalizations.of(context)!.description,
                        hintStyle: themeProvider.theme.textTheme.bodyLarge!,
                        borderColor: MyAppColors.gray,
                        maxLines: 5,
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return 'please enter event description';
                          }
                          return null;
                        },
                        onChanged: (text) {
                          desc = text;
                        },
                      ),
                      SizedBox(
                        height: screen.height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ImageIcon(
                                AssetImage('assets/images/ic_date.png'),
                                color: (isLightTheme)
                                    ? MyAppColors.black
                                    : MyAppColors.white,
                              ),
                              SizedBox(
                                width: screen.width * .02,
                              ),
                              Text(
                                AppLocalizations.of(context)!.event_date,
                                style:
                                    themeProvider.theme.textTheme.displayMedium,
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () async {
                              var chosenDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate:
                                    DateTime.now().add(Duration(days: 365)),
                              );
                              if (chosenDate != null) {
                                date = chosenDate;
                              }
                              setState(() {});
                            },
                            child: Text(
                              (date == null)
                                  ? AppLocalizations.of(context)!.choose_date
                                  : "${date!.day}/${date!.month}/${date!.year}",
                              style: themeProvider.theme.textTheme.displaySmall,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: screen.height * .02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              ImageIcon(
                                AssetImage('assets/images/ic_time.png'),
                                color: (isLightTheme)
                                    ? MyAppColors.black
                                    : MyAppColors.white,
                              ),
                              SizedBox(
                                width: screen.width * .02,
                              ),
                              Text(
                                AppLocalizations.of(context)!.event_time,
                                style:
                                    themeProvider.theme.textTheme.displayMedium,
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () async {
                              var chosenTime = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.now(),
                              );
                              if (chosenTime != null) {
                                time = chosenTime;
                              }
                              setState(() {});
                            },
                            child: Text(
                              (time == null)
                                  ? AppLocalizations.of(context)!.choose_time
                                  : '${time!.format(context)}',
                              style: themeProvider.theme.textTheme.displaySmall,
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: screen.height * .02,
                      ),
                      Text(
                        AppLocalizations.of(context)!.location,
                        style: themeProvider.theme.textTheme.displaySmall,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
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
                                style:
                                    themeProvider.theme.textTheme.displaySmall,
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: MyAppColors.primary,
                              ),
                              SizedBox(
                                height: screen.height * .02,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screen.height * .02,
                      ),
                      CustomElevatedButton(
                        onClick: () {
                          if (formKey.currentState?.validate() == true &&
                              date != null &&
                              time != null) {
                            FireBaseUtils.addEventToFireStore(EventModel(
                                    title: title,
                                    desc: desc,
                                    type: eventType,
                                    date: date!,
                                    time: time!.format(context),
                                    image: image))
                                .timeout(Duration(milliseconds: 500),onTimeout: () {
                                  eventListProvider.getAllEvents(onClick: (){});
                                  Navigator.pop(context);
                                },);
                          }
                        },
                        text: AppLocalizations.of(context)!.add_event,
                        center: true,
                        textStyle: MyThemeData.lightTheme.textTheme.titleLarge,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

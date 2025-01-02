import 'package:event_plannig/Profile_tab/profile_tab.dart';
import 'package:event_plannig/auth/register_screen.dart';
import 'package:event_plannig/create_event_screen/create_event_screen.dart';
import 'package:event_plannig/favorite_tab/favorite_tab.dart';
import 'package:event_plannig/home_tab/home_tab.dart';
import 'package:event_plannig/map_tab/map_tab.dart';
import 'package:event_plannig/my_app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> tabs = [HomeTab(), MapTab(), FavoriteTab(), ProfileTab()];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    bool showFab=MediaQuery.of(context).viewInsets.bottom !=0;
    return Scaffold(
      body: tabs[index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: (index == 0)
                  ? ImageIcon(
                      AssetImage("assets/images/ic_selected_home.png"),
                    )
                  : ImageIcon(
                      AssetImage("assets/images/ic_unselected_home.png")),
              label: AppLocalizations.of(context)!.home),
          BottomNavigationBarItem(
              icon: (index == 1)
                  ? ImageIcon(AssetImage("assets/images/ic_selected_map.png"))
                  : ImageIcon(
                      AssetImage("assets/images/ic_unselected_map.png")),
              label: AppLocalizations.of(context)!.map),
          BottomNavigationBarItem(
              icon: (index == 2)
                  ? ImageIcon(
                      AssetImage("assets/images/ic_selected_favorite.png"))
                  : ImageIcon(
                      AssetImage("assets/images/ic_unselected_favorite.png")),
              label: AppLocalizations.of(context)!.favorite),
          BottomNavigationBarItem(
              icon: (index == 3)
                  ? ImageIcon(
                      AssetImage("assets/images/ic_selected_profile.png"))
                  : ImageIcon(
                      AssetImage("assets/images/ic_unselected_profile.png")),
              label: AppLocalizations.of(context)!.profile),
        ],
        selectedItemColor: MyAppColors.white,
        unselectedItemColor: MyAppColors.white,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
      floatingActionButton: Visibility(
        visible: !showFab,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, CreateEventScreen.routeName);
          },
          child: Icon(
            Icons.add,
            color: MyAppColors.white,
            size: 35,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

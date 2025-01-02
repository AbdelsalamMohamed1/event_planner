import 'package:event_plannig/auth/register_screen.dart';
import 'package:event_plannig/home_screen.dart';
import 'package:event_plannig/my_app_colors.dart';
import 'package:event_plannig/my_theme_data.dart';
import 'package:event_plannig/my_widget/custom_elevated_button.dart';
import 'package:event_plannig/my_widget/custom_text_form_field.dart';
import 'package:event_plannig/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  static String routeName = 'LoginScreen';

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;
    var themeProvider = Provider.of<ThemeProvider>(context);
    bool isLightTheme = (themeProvider.theme == MyThemeData.lightTheme);
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image(
              image: AssetImage('assets/images/Logo.png'),
              height: screen.height * .23,
            ),
            SizedBox(
              height: screen.height * .02,
            ),
            CustomTextFormField(
              hintText: AppLocalizations.of(context)!.email,
              hintStyle: themeProvider.theme.textTheme.bodyLarge!,
              borderColor:
                  (isLightTheme) ? MyAppColors.gray : MyAppColors.primary,
              prefix: ImageIcon(
                AssetImage('assets/images/ic_email.png'),
                color: (isLightTheme) ? MyAppColors.gray : MyAppColors.primary,
              ),
            ),
            SizedBox(
              height: screen.height * .02,
            ),
            CustomTextFormField(
              hintText: AppLocalizations.of(context)!.password,
              hintStyle: themeProvider.theme.textTheme.bodyLarge!,
              borderColor:
                  (isLightTheme) ? MyAppColors.gray : MyAppColors.primary,
              prefix: ImageIcon(
                AssetImage('assets/images/ic_password.png'),
                color: (isLightTheme) ? MyAppColors.gray : MyAppColors.primary,
              ),
              suffix: ImageIcon(
                AssetImage('assets/images/ic_hide.png'),
                color: (isLightTheme) ? MyAppColors.gray : MyAppColors.primary,
              ),
            ),
            SizedBox(
              height: screen.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () {},
                    child: Text(
                      AppLocalizations.of(context)!.forgot_password,
                      style: themeProvider.theme.textTheme.headlineMedium,
                    )),
              ],
            ),
            SizedBox(
              height: screen.height * .02,
            ),
            CustomElevatedButton(
              onClick: () {
                Navigator.pushReplacementNamed(context, HomeScreen.routeName);
              },
              text: AppLocalizations.of(context)!.login,
              textStyle: themeProvider.theme.textTheme.bodyMedium,
              center: true,
            ),
            SizedBox(
              height: screen.height * .02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.do_not_have_account,
                  style: themeProvider.theme.textTheme.displayMedium,
                ),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, RegisterScreen.routeName);
                    },
                    child: Text(
                      AppLocalizations.of(context)!.create_Account,
                      style: themeProvider.theme.textTheme.headlineMedium,
                    )),
                SizedBox(
                  height: screen.height * .02,
                ),
              ],
            ),
            SizedBox(
              height: screen.height * .02,
            ),
            Row(
              children: [
                Expanded(
                    child: Divider(
                  color: MyAppColors.primary,
                  endIndent: 15,
                )),
                Text(
                  AppLocalizations.of(context)!.or,
                  style: themeProvider.theme.textTheme.titleSmall,
                ),
                Expanded(
                    child: Divider(
                  color: MyAppColors.primary,
                  indent: 15,
                ))
              ],
            ),
            SizedBox(
              height: screen.height * .02,
            ),
            CustomElevatedButton(
              onClick: () {},
              text: " "+AppLocalizations.of(context)!.login_with_google,
              textStyle: themeProvider.theme.textTheme.titleSmall,
              center: true,
              imageIcon: ImageIcon(AssetImage('assets/images/ic_google.png'),color: MyAppColors.primary,),
              backgroundColor: Colors.transparent,
            )
          ],
        ),
      )),
    );
  }
}

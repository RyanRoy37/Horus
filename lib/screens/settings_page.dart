import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../entities/localization_mixin.dart';
import '../tools/shared_pref_tool.dart';
import '../theme_provider.dart';
import 'about_page.dart';
import 'help_page.dart';
import '../pages/settings_child_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        SharedPrefTool.saveSettings();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocale.settings.getString(context)),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // UI language
            ListTile(
              title: Text(
                AppLocale.uiLanguage.getString(context),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(languageMap[SharedPrefTool.uiLanguage]!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsChildPage(
                      title: AppLocale.uiLanguage.getString(context),
                      map: languageMap,
                      selected: SharedPrefTool.uiLanguage,
                      callback: (value) {
                        FlutterLocalization.instance.translate(value);
                        SharedPrefTool.uiLanguage = value;
                      },
                    ),
                  ),
                ).then((value) {
                  setState(() {});
                });
              },
            ),
            const Divider(),

            // Common name language
            ListTile(
              title: Text(
                AppLocale.cnLanguage.getString(context),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(languageMap[SharedPrefTool.cnLanguage]!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsChildPage(
                      title: AppLocale.cnLanguage.getString(context),
                      map: languageMap,
                      selected: SharedPrefTool.cnLanguage,
                      callback: (value) {
                        SharedPrefTool.cnLanguage = value;
                      },
                    ),
                  ),
                ).then((value) {
                  setState(() {});
                });
              },
            ),
            const Divider(),

            // Species Name Display
            ListTile(
              title: Text(
                AppLocale.nameDisplay.getString(context),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            RadioListTile<String>(
              title: Text(AppLocale.commonName.getString(context)),
              value: AppLocale.commonName,
              groupValue: SharedPrefTool.selectedSpeciesDisplay,
              onChanged: (value) {
                setState(() {
                  SharedPrefTool.selectedSpeciesDisplay = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text(AppLocale.scientificName.getString(context)),
              value: AppLocale.scientificName,
              groupValue: SharedPrefTool.selectedSpeciesDisplay,
              onChanged: (value) {
                setState(() {
                  SharedPrefTool.selectedSpeciesDisplay = value!;
                });
              },
            ),
            RadioListTile<String>(
              title: Text(AppLocale.nameBoth.getString(context)),
              value: AppLocale.nameBoth,
              groupValue: SharedPrefTool.selectedSpeciesDisplay,
              onChanged: (value) {
                setState(() {
                  SharedPrefTool.selectedSpeciesDisplay = value!;
                });
              },
            ),
            const Divider(),

            // Dark mode toggle
            ListTile(
              leading: const Icon(Icons.dark_mode),
              title: const Text('Dark Mode'),
              trailing: Switch(
                value: themeProvider.isDarkMode,
                onChanged: (val) => themeProvider.toggleTheme(val),
              ),
            ),
            const Divider(),

            // About App
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('About App'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutPage()),
                );
              },
            ),

            // Help & Feedback
            ListTile(
              leading: const Icon(Icons.help_outline),
              title: const Text('Help & Feedback'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const HelpFeedbackPage()),
                );
              },
            ),

            const Divider(),

            // GitHub Link
            ListTile(
              title: const Text('GitHub'),
              trailing: const Icon(Icons.open_in_browser_rounded),
              onTap: () => launchUrl(
                Uri.parse("https://github.com/sun-jiao/osea_mobile"),
                mode: LaunchMode.externalApplication,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

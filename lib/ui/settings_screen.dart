import 'dart:io';

import 'package:dicoding_news_app/provider/preferences_provider.dart';
import 'package:dicoding_news_app/provider/scheduling_provider.dart';
import 'package:dicoding_news_app/widgets/custom_dialog.dart';
import 'package:dicoding_news_app/widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  static const String settingsTitle = 'Settings';
  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: _buildSettingList(context),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Settings'),
      ),
      child: _buildSettingList(context),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(androidBuilder: _buildAndroid, iosBuilder: _buildIos);
  }

  Widget _buildSettingList(BuildContext context) {
    return Consumer<PreferencesProvider>(
      builder: (context, provider, child) {
        return ListView(
          children: [
            Material(
              child: ListTile(
                title: Text('Dark Theme'),
                trailing: Switch.adaptive(
                    value: provider.isDarkTheme,
                    onChanged: (value) {
                      provider.enableDarkTheme(value);
                    }),
              ),
            ),
            Material(
              child: ListTile(
                title: Text('Scheduling News'),
                trailing: Consumer<SchedulingProvider>(
                  builder: (context, scheduled, _) {
                    return Switch.adaptive(
                        value: provider.isDailyNewsActive,
                        onChanged: (value) async {
                          if (Platform.isIOS) {
                            customDialog(context);
                          } else {
                            scheduled.scheduledNews(value);
                            provider.enableDailyNews(value);
                          }
                        });
                  },
                ),
              ),
            ),
          ],
        );
      },
      
    );
  }
}

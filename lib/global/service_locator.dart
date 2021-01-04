import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:get_it/get_it.dart';
import 'package:okr/managers/objectives_manager.dart';
import 'package:okr/managers/theme_manager.dart';
import 'package:okr/models/common_data.dart';
import 'package:okr/models/objective.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void generalSetup() {
  // Setup SharedPreferences instance
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    Command.catchAlwaysDefault = false;
    var _prefs = await SharedPreferences.getInstance();
    return _prefs;
  });
}

void setupUser(String userName) async {
  // unregister managers specific for other users.
  if (!getIt.isRegistered<ObjectivesManager>()) {
    getIt.registerSingletonWithDependencies<ObjectivesManager>(
        () => ObjectivesManager(userName),
        dependsOn: [SharedPreferences]);
  } else {
    GetIt.I<ObjectivesManager>().userName = userName;
  }

  if (!getIt.isRegistered<ThemeManager>()) {
    getIt.registerSingletonWithDependencies<ThemeManager>(
        () => ThemeManager(userName),
        dependsOn: [SharedPreferences]);
  } else {
    GetIt.I<ThemeManager>().userName = userName;
  }

  var _prefs = GetIt.I<SharedPreferences>();
  if (!_prefs.containsKey(userName)) {
    var initialUserData = UserData(
      FlexTheme(themeMode: ThemeMode.dark, themeIndex: 3),
      [],
    );
    await _prefs.setString(userName, jsonEncode(initialUserData.toJson()));
  }
}

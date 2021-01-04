import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_command/flutter_command.dart';
import 'package:get_it/get_it.dart';
import 'package:okr/models/common_data.dart';
import 'package:okr/models/objective.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeManager {
  /// A command to intimate the user selected theme.
  Command<FlexTheme, FlexTheme> themeChangeCommand;
  String userName;
  ThemeManager(this.userName) {
    themeChangeCommand = Command.createAsync<FlexTheme, FlexTheme>(
      persistAndNotifyTheme,
      FlexTheme(themeMode: ThemeMode.light, themeIndex: 0),
    );
  }

  Future<FlexTheme> persistAndNotifyTheme(FlexTheme flexTheme) async {
    var _pref = GetIt.I<SharedPreferences>();
    String userDataJson = await _pref.getString(this.userName);
    UserData userData = UserData.fromJson(jsonDecode(userDataJson));
    UserData newUserData = userData.copyWith(flexTheme: flexTheme);
    await _pref.setString(this.userName, jsonEncode(newUserData.toJson()));
    return flexTheme;
  }
}

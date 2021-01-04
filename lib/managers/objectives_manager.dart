import 'dart:convert';

import 'package:flutter_command/flutter_command.dart';
import 'package:get_it/get_it.dart';
import 'package:okr/models/objective.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class ObjectivesManager {
  /// Creates a dummy [Objective] while creating a new objective.
  Command<void, bool> initiateNewObjectiveCommand;

  /// Inserts the new [Objective].
  Command<Objective, bool> addObjectiveCommand;

  /// Updates the existing [Objective].
  Command<Objective, bool> updateObjectiveCommand;

  /// Deletes the [Objective].
  Command<String, bool> deleteObjectiveCommand;

  /// Loads all the [Objective] stored for a [userName].
  Command<void, UserData> loadAllObjectivesCommand;

  /// Disperse the cancel edit command of individual objective in the UI.
  Command<String, bool> cancelEditObjectiveCommand;

  /// Currently active user.
  String userName;

  SharedPreferences _prefs;

  ObjectivesManager(this.userName) {
    this.addObjectiveCommand =
        Command.createAsync<Objective, bool>(addObjective, null);
    this.updateObjectiveCommand =
        Command.createAsync<Objective, bool>(updateObjective, null);
    this.loadAllObjectivesCommand =
        Command.createAsyncNoParam<UserData>(loadAllObjectives, null);
    this.initiateNewObjectiveCommand =
        Command.createAsyncNoParam<bool>(initiateNewObjective, null);
    this.deleteObjectiveCommand =
        Command.createAsync<String, bool>(deleteObjective, null);
    this.cancelEditObjectiveCommand =
        Command.createAsync<String, bool>(cancelEditObjective, null);

    _prefs = GetIt.I<SharedPreferences>();
  }

  Future<bool> addObjective(Objective newObjective) async {
    if (newObjective != null) {
      if (newObjective.id.contains('temp_')) {
        await deleteObjective(newObjective.id);
        newObjective = newObjective.copyWith(
            id: newObjective.id.replaceFirst('temp_', ''));
      }
      String userData = await _prefs.get(this.userName);
      var old_userData = UserData.fromJson(jsonDecode(userData));
      old_userData.objectives.add(newObjective);
      UserData new_userData =
          old_userData.copyWith(objectives: old_userData.objectives);
      bool saveSuccess = await _prefs.setString(
          this.userName, json.encode(new_userData.toJson()));
      // Reloads the all the objectives in UI. This needs to be delayed by a
      // frame somhow for correct results :( not sure why.
      Future.delayed(
          Duration(milliseconds: 16), () => loadAllObjectivesCommand());
      return saveSuccess;
    }
    return false;
  }

  Future<bool> updateObjective(Objective updatedObjective) async {
    if (updatedObjective != null) {
      String userData = await _prefs.get(this.userName);
      var old_userData = UserData.fromJson(jsonDecode(userData));
      old_userData.objectives
          .removeWhere((element) => element.id == updatedObjective.id);
      old_userData.objectives.add(updatedObjective);
      UserData new_userData =
          old_userData.copyWith(objectives: old_userData.objectives);
      bool saveSuccess = await _prefs.setString(
          this.userName, json.encode(new_userData.toJson()));
      // Reloads the all the objectives in UI. This needs to be delayed by a
      // frame somhow for correct results :( not sure why.
      Future.delayed(Duration(milliseconds: 16),
          () async => await loadAllObjectivesCommand());
      return saveSuccess;
    }
    return false;
  }

  Future<UserData> loadAllObjectives() async {
    String userData = await _prefs.getString(this.userName);
    if (userData != null) {
      UserData result = UserData.fromJson(jsonDecode(userData));
      result.objectives.sort((a, b) => a.sortIndex.compareTo(b.sortIndex));
      return result;
    }
    return null;
  }

  Future<bool> initiateNewObjective() async {
    Uuid uuid = Uuid();
    String new_id = uuid.v4();

    String userData = await _prefs.get(this.userName);
    var old_userData = UserData.fromJson(jsonDecode(userData));
    Objective newObjective =
        Objective('temp_' + new_id, old_userData.objectives.length, '', []);
    old_userData.objectives.add(newObjective);
    UserData new_userData =
        old_userData.copyWith(objectives: old_userData.objectives);
    bool saveSuccess = await _prefs.setString(
        this.userName, json.encode(new_userData.toJson()));
    // Reloads the all the objectives in UI. This needs to be delayed by a
    // frame somhow for correct results :( not sure why.
    Future.delayed(
        Duration(milliseconds: 16), () => loadAllObjectivesCommand());
    return saveSuccess;
  }

  Future<bool> deleteObjective(String objectiveId) async {
    if (objectiveId != null) {
      String userData = await _prefs.get(this.userName);
      var old_userData = UserData.fromJson(jsonDecode(userData));
      old_userData.objectives
          .removeWhere((objective) => objective.id == objectiveId);
      UserData new_userData =
          old_userData.copyWith(objectives: old_userData.objectives);
      await _prefs.setString(this.userName, json.encode(new_userData.toJson()));
      // Reloads the all the objectives in UI. This needs to be delayed by a
      // frame somhow for correct results :( not sure why.
      Future.delayed(
          Duration(milliseconds: 16), () => loadAllObjectivesCommand());
      return true;
    }
    return false;
  }

  Future<bool> cancelEditObjective(String objectiveId) async {
    if (objectiveId != null &&
        objectiveId.isNotEmpty &&
        objectiveId.contains('temp_')) {
      return await deleteObjective(objectiveId);
    }
    return true;
  }
}

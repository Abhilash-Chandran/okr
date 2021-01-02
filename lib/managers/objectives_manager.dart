import 'dart:convert';

import 'package:flutter_command/flutter_command.dart';
import 'package:get_it/get_it.dart';
import 'package:okr/models/objective.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class ObjectivesManager {
  Command<void, bool> initiateNewObjectiveCommand;
  Command<Objective, bool> addObjectiveCommand;
  Command<void, bool> toggleEditModeObjectiveCommand;
  Command<Objective, Objective> updateObjectiveCommand;
  Command<String, bool> deleteObjectiveCommand;
  Command<Objective, Objective> addKeyResultCommand;
  Command<void, Objectives> loadAllObjectivesCommand;
  Command<void, bool> toggleAddObjectiveCommand;
  Command<String, bool> cancelEditObjectiveCommand;
  String user;

  SharedPreferences _prefs;

  ObjectivesManager(this.user) {
    this.addObjectiveCommand =
        Command.createAsync<Objective, bool>(addObjective, null);
    this.loadAllObjectivesCommand =
        Command.createAsync<void, Objectives>((x) => loadAllObjectives(), null);
    this.initiateNewObjectiveCommand =
        Command.createAsyncNoParam<bool>(initiateNewObjective, null);
    this.deleteObjectiveCommand =
        Command.createAsync<String, bool>(deleteObjective, null);
    this.cancelEditObjectiveCommand =
        Command.createAsync<String, bool>(cancelEditObjective, null);
    this.toggleEditModeObjectiveCommand =
        Command.createAsync<String, bool>(toggleEditModeObjective, null);
    _prefs = GetIt.I<SharedPreferences>();
  }

  Future<bool> addObjective(Objective newObjective) async {
    if (newObjective != null) {
      if (newObjective.id.contains('temp_')) {
        await deleteObjective(newObjective.id);
        newObjective = newObjective.copyWith(
            id: newObjective.id.replaceFirst('temp_', ''));
      }
      String objectives = await _prefs.get(this.user);
      var old_objectives = Objectives.fromJson(jsonDecode(objectives));
      old_objectives.objectives.add(newObjective);
      Objectives new_objectives =
          old_objectives.copyWith(objectives: old_objectives.objectives);
      bool saveSuccess = await _prefs.setString(
          this.user, json.encode(new_objectives.toJson()));

      // reload the objectives. Somehow without the delayed command
      if (saveSuccess)
        Future.delayed(
            Duration(milliseconds: 16), () => loadAllObjectivesCommand());
      return saveSuccess;
    }
    return false;
  }

  Future<Objectives> loadAllObjectives() async {
    String objectives = await _prefs.getString(this.user);
    if (objectives != null) {
      Objectives result = Objectives.fromJson(jsonDecode(objectives));
      result.objectives.sort((a, b) => a.sortIndex.compareTo(b.sortIndex));
      return result;
    }
    return null;
  }

  Future<bool> initiateNewObjective() async {
    Uuid uuid = Uuid();
    String new_id = uuid.v4();

    String objectives = await _prefs.get(this.user);
    var old_objectives = Objectives.fromJson(jsonDecode(objectives));
    Objective newObjective = Objective(
        'temp_' + new_id, old_objectives.objectives.length, true, '', []);
    old_objectives.objectives.add(newObjective);
    Objectives new_objectives =
        old_objectives.copyWith(objectives: old_objectives.objectives);
    bool saveSuccess =
        await _prefs.setString(this.user, json.encode(new_objectives.toJson()));
    // reload the objectives.
    loadAllObjectivesCommand();

    return saveSuccess;
  }

  Future<bool> toggleEditModeObjective(String objectiveId) async {
    String objectives = await _prefs.get(this.user);
    var old_objectives = Objectives.fromJson(jsonDecode(objectives));
    var objective = old_objectives.objectives
        .firstWhere((element) => element.id == objectiveId);
    var editModeObjective = objective.copyWith(editMode: !objective.editMode);
    old_objectives.objectives
        .removeWhere((element) => element.id == objectiveId);
    old_objectives.objectives.add(editModeObjective);
    Objectives new_objectives =
        old_objectives.copyWith(objectives: old_objectives.objectives);
    bool saveSuccess =
        await _prefs.setString(this.user, json.encode(new_objectives.toJson()));
    if (saveSuccess)
      Future.delayed(
          Duration(milliseconds: 16), () => loadAllObjectivesCommand());
    // // reload the objectives.
    // loadAllObjectivesCommand();
    return saveSuccess;
  }

  Future<bool> deleteObjective(String objectiveId) async {
    if (objectiveId != null) {
      String objectives = await _prefs.get(this.user);
      var old_objectives = Objectives.fromJson(jsonDecode(objectives));
      old_objectives.objectives
          .removeWhere((objective) => objective.id == objectiveId);
      Objectives new_objectives =
          old_objectives.copyWith(objectives: old_objectives.objectives);
      await _prefs.setString(this.user, json.encode(new_objectives.toJson()));
      // reload the objectives.
      loadAllObjectivesCommand();
      return true;
    }
    return false;
  }

  Future<bool> cancelEditObjective(String objectiveId) async {
    if (objectiveId != null &&
        objectiveId.isNotEmpty &&
        objectiveId.contains('temp_')) {
      return await deleteObjective(objectiveId);
    } else if (objectiveId != null && objectiveId.isNotEmpty) {
      return await toggleEditModeObjective(objectiveId);
    }
    return true;
  }
}

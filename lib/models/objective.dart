import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'objective.freezed.dart';
part 'objective.g.dart';

@freezed
abstract class Objectives with _$Objectives {
  const factory Objectives(List<Objective> objectives) = _Objectives;
  factory Objectives.fromJson(Map<String, dynamic> json) =>
      _$ObjectivesFromJson(json);
}

@freezed
abstract class Objective with _$Objective {
  const factory Objective(String id, int sortIndex, bool editMode, String title,
      List<KeyResult> keyResults) = _Objective;
  factory Objective.fromJson(Map<String, dynamic> json) =>
      _$ObjectiveFromJson(json);
}

@freezed
abstract class KeyResult with _$KeyResult {
  const factory KeyResult(String title, double progress) = _KeyResult;
  factory KeyResult.fromJson(Map<String, dynamic> json) =>
      _$KeyResultFromJson(json);
}

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
abstract class KeyResult with _$KeyResult {
  const factory KeyResult(
    String title,
    double progress,
  ) = _KeyResult;
  factory KeyResult.fromJson(Map<String, dynamic> json) =>
      _$KeyResultFromJson(json);
}

@freezed
abstract class Objective with _$Objective {
  const factory Objective(
    String id,
    int sortIndex,
    String title,
    List<KeyResult> keyResults,
  ) = _Objective;
  factory Objective.fromJson(Map<String, dynamic> json) =>
      _$ObjectiveFromJson(json);
}

// @freezed
// abstract class HKeyResult with _$HKeyResult {
//   @HiveType(typeId: 1)
//   const factory HKeyResult(
//     @HiveField(0) String title,
//     @HiveField(1) double progress,
//   ) = _HKeyResult;
//   factory HKeyResult.fromJson(Map<String, dynamic> json) =>
//       _$HKeyResultFromJson(json);
// }

// @freezed
// abstract class HObjective with _$HObjective {
//   @HiveType(typeId: 2)
//   const factory HObjective(
//     @HiveField(0) String id,
//     @HiveField(1) int sortIndex,
//     @HiveField(2) bool editMode,
//     @HiveField(3) String title,
//     @JsonKey(fromJson: fromJsons, toJson: toJsons)
//     @HiveField(4)
//         HiveList<KeyResult> keyResults,
//   ) = _HObjective;
//   factory HObjective.fromJson(Map<String, dynamic> json) =>
//       _$HObjectiveFromJson(json);
// }

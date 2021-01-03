// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'objective.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Objectives _$_$_ObjectivesFromJson(Map<String, dynamic> json) {
  return _$_Objectives(
    (json['objectives'] as List)
        ?.map((e) =>
            e == null ? null : Objective.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_ObjectivesToJson(_$_Objectives instance) =>
    <String, dynamic>{
      'objectives': instance.objectives,
    };

_$_KeyResult _$_$_KeyResultFromJson(Map<String, dynamic> json) {
  return _$_KeyResult(
    json['title'] as String,
    (json['progress'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_KeyResultToJson(_$_KeyResult instance) =>
    <String, dynamic>{
      'title': instance.title,
      'progress': instance.progress,
    };

_$_Objective _$_$_ObjectiveFromJson(Map<String, dynamic> json) {
  return _$_Objective(
    json['id'] as String,
    json['sortIndex'] as int,
    json['title'] as String,
    (json['keyResults'] as List)
        ?.map((e) =>
            e == null ? null : KeyResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$_$_ObjectiveToJson(_$_Objective instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sortIndex': instance.sortIndex,
      'title': instance.title,
      'keyResults': instance.keyResults,
    };

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'common_data.freezed.dart';

@freezed
abstract class ToggleEdit with _$ToggleEdit {
  const factory ToggleEdit({String objectiveId, bool editMode}) = _ToggleEdit;
}

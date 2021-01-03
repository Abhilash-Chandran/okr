// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'common_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ToggleEditTearOff {
  const _$ToggleEditTearOff();

// ignore: unused_element
  _ToggleEdit call({String objectiveId, bool editMode}) {
    return _ToggleEdit(
      objectiveId: objectiveId,
      editMode: editMode,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ToggleEdit = _$ToggleEditTearOff();

/// @nodoc
mixin _$ToggleEdit {
  String get objectiveId;
  bool get editMode;

  $ToggleEditCopyWith<ToggleEdit> get copyWith;
}

/// @nodoc
abstract class $ToggleEditCopyWith<$Res> {
  factory $ToggleEditCopyWith(
          ToggleEdit value, $Res Function(ToggleEdit) then) =
      _$ToggleEditCopyWithImpl<$Res>;
  $Res call({String objectiveId, bool editMode});
}

/// @nodoc
class _$ToggleEditCopyWithImpl<$Res> implements $ToggleEditCopyWith<$Res> {
  _$ToggleEditCopyWithImpl(this._value, this._then);

  final ToggleEdit _value;
  // ignore: unused_field
  final $Res Function(ToggleEdit) _then;

  @override
  $Res call({
    Object objectiveId = freezed,
    Object editMode = freezed,
  }) {
    return _then(_value.copyWith(
      objectiveId:
          objectiveId == freezed ? _value.objectiveId : objectiveId as String,
      editMode: editMode == freezed ? _value.editMode : editMode as bool,
    ));
  }
}

/// @nodoc
abstract class _$ToggleEditCopyWith<$Res> implements $ToggleEditCopyWith<$Res> {
  factory _$ToggleEditCopyWith(
          _ToggleEdit value, $Res Function(_ToggleEdit) then) =
      __$ToggleEditCopyWithImpl<$Res>;
  @override
  $Res call({String objectiveId, bool editMode});
}

/// @nodoc
class __$ToggleEditCopyWithImpl<$Res> extends _$ToggleEditCopyWithImpl<$Res>
    implements _$ToggleEditCopyWith<$Res> {
  __$ToggleEditCopyWithImpl(
      _ToggleEdit _value, $Res Function(_ToggleEdit) _then)
      : super(_value, (v) => _then(v as _ToggleEdit));

  @override
  _ToggleEdit get _value => super._value as _ToggleEdit;

  @override
  $Res call({
    Object objectiveId = freezed,
    Object editMode = freezed,
  }) {
    return _then(_ToggleEdit(
      objectiveId:
          objectiveId == freezed ? _value.objectiveId : objectiveId as String,
      editMode: editMode == freezed ? _value.editMode : editMode as bool,
    ));
  }
}

/// @nodoc
class _$_ToggleEdit with DiagnosticableTreeMixin implements _ToggleEdit {
  const _$_ToggleEdit({this.objectiveId, this.editMode});

  @override
  final String objectiveId;
  @override
  final bool editMode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ToggleEdit(objectiveId: $objectiveId, editMode: $editMode)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ToggleEdit'))
      ..add(DiagnosticsProperty('objectiveId', objectiveId))
      ..add(DiagnosticsProperty('editMode', editMode));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ToggleEdit &&
            (identical(other.objectiveId, objectiveId) ||
                const DeepCollectionEquality()
                    .equals(other.objectiveId, objectiveId)) &&
            (identical(other.editMode, editMode) ||
                const DeepCollectionEquality()
                    .equals(other.editMode, editMode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(objectiveId) ^
      const DeepCollectionEquality().hash(editMode);

  @override
  _$ToggleEditCopyWith<_ToggleEdit> get copyWith =>
      __$ToggleEditCopyWithImpl<_ToggleEdit>(this, _$identity);
}

abstract class _ToggleEdit implements ToggleEdit {
  const factory _ToggleEdit({String objectiveId, bool editMode}) =
      _$_ToggleEdit;

  @override
  String get objectiveId;
  @override
  bool get editMode;
  @override
  _$ToggleEditCopyWith<_ToggleEdit> get copyWith;
}

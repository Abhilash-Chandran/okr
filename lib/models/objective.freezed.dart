// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'objective.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _Objectives.fromJson(json);
}

/// @nodoc
class _$UserDataTearOff {
  const _$UserDataTearOff();

// ignore: unused_element
  _Objectives call(FlexTheme flexTheme, List<Objective> objectives) {
    return _Objectives(
      flexTheme,
      objectives,
    );
  }

// ignore: unused_element
  UserData fromJson(Map<String, Object> json) {
    return UserData.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $UserData = _$UserDataTearOff();

/// @nodoc
mixin _$UserData {
  FlexTheme get flexTheme;
  List<Objective> get objectives;

  Map<String, dynamic> toJson();
  $UserDataCopyWith<UserData> get copyWith;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res>;
  $Res call({FlexTheme flexTheme, List<Objective> objectives});

  $FlexThemeCopyWith<$Res> get flexTheme;
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res> implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  final UserData _value;
  // ignore: unused_field
  final $Res Function(UserData) _then;

  @override
  $Res call({
    Object flexTheme = freezed,
    Object objectives = freezed,
  }) {
    return _then(_value.copyWith(
      flexTheme:
          flexTheme == freezed ? _value.flexTheme : flexTheme as FlexTheme,
      objectives: objectives == freezed
          ? _value.objectives
          : objectives as List<Objective>,
    ));
  }

  @override
  $FlexThemeCopyWith<$Res> get flexTheme {
    if (_value.flexTheme == null) {
      return null;
    }
    return $FlexThemeCopyWith<$Res>(_value.flexTheme, (value) {
      return _then(_value.copyWith(flexTheme: value));
    });
  }
}

/// @nodoc
abstract class _$ObjectivesCopyWith<$Res> implements $UserDataCopyWith<$Res> {
  factory _$ObjectivesCopyWith(
          _Objectives value, $Res Function(_Objectives) then) =
      __$ObjectivesCopyWithImpl<$Res>;
  @override
  $Res call({FlexTheme flexTheme, List<Objective> objectives});

  @override
  $FlexThemeCopyWith<$Res> get flexTheme;
}

/// @nodoc
class __$ObjectivesCopyWithImpl<$Res> extends _$UserDataCopyWithImpl<$Res>
    implements _$ObjectivesCopyWith<$Res> {
  __$ObjectivesCopyWithImpl(
      _Objectives _value, $Res Function(_Objectives) _then)
      : super(_value, (v) => _then(v as _Objectives));

  @override
  _Objectives get _value => super._value as _Objectives;

  @override
  $Res call({
    Object flexTheme = freezed,
    Object objectives = freezed,
  }) {
    return _then(_Objectives(
      flexTheme == freezed ? _value.flexTheme : flexTheme as FlexTheme,
      objectives == freezed ? _value.objectives : objectives as List<Objective>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Objectives with DiagnosticableTreeMixin implements _Objectives {
  const _$_Objectives(this.flexTheme, this.objectives)
      : assert(flexTheme != null),
        assert(objectives != null);

  factory _$_Objectives.fromJson(Map<String, dynamic> json) =>
      _$_$_ObjectivesFromJson(json);

  @override
  final FlexTheme flexTheme;
  @override
  final List<Objective> objectives;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserData(flexTheme: $flexTheme, objectives: $objectives)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserData'))
      ..add(DiagnosticsProperty('flexTheme', flexTheme))
      ..add(DiagnosticsProperty('objectives', objectives));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Objectives &&
            (identical(other.flexTheme, flexTheme) ||
                const DeepCollectionEquality()
                    .equals(other.flexTheme, flexTheme)) &&
            (identical(other.objectives, objectives) ||
                const DeepCollectionEquality()
                    .equals(other.objectives, objectives)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(flexTheme) ^
      const DeepCollectionEquality().hash(objectives);

  @override
  _$ObjectivesCopyWith<_Objectives> get copyWith =>
      __$ObjectivesCopyWithImpl<_Objectives>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ObjectivesToJson(this);
  }
}

abstract class _Objectives implements UserData {
  const factory _Objectives(FlexTheme flexTheme, List<Objective> objectives) =
      _$_Objectives;

  factory _Objectives.fromJson(Map<String, dynamic> json) =
      _$_Objectives.fromJson;

  @override
  FlexTheme get flexTheme;
  @override
  List<Objective> get objectives;
  @override
  _$ObjectivesCopyWith<_Objectives> get copyWith;
}

KeyResult _$KeyResultFromJson(Map<String, dynamic> json) {
  return _KeyResult.fromJson(json);
}

/// @nodoc
class _$KeyResultTearOff {
  const _$KeyResultTearOff();

// ignore: unused_element
  _KeyResult call(String title, double progress) {
    return _KeyResult(
      title,
      progress,
    );
  }

// ignore: unused_element
  KeyResult fromJson(Map<String, Object> json) {
    return KeyResult.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $KeyResult = _$KeyResultTearOff();

/// @nodoc
mixin _$KeyResult {
  String get title;
  double get progress;

  Map<String, dynamic> toJson();
  $KeyResultCopyWith<KeyResult> get copyWith;
}

/// @nodoc
abstract class $KeyResultCopyWith<$Res> {
  factory $KeyResultCopyWith(KeyResult value, $Res Function(KeyResult) then) =
      _$KeyResultCopyWithImpl<$Res>;
  $Res call({String title, double progress});
}

/// @nodoc
class _$KeyResultCopyWithImpl<$Res> implements $KeyResultCopyWith<$Res> {
  _$KeyResultCopyWithImpl(this._value, this._then);

  final KeyResult _value;
  // ignore: unused_field
  final $Res Function(KeyResult) _then;

  @override
  $Res call({
    Object title = freezed,
    Object progress = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed ? _value.title : title as String,
      progress: progress == freezed ? _value.progress : progress as double,
    ));
  }
}

/// @nodoc
abstract class _$KeyResultCopyWith<$Res> implements $KeyResultCopyWith<$Res> {
  factory _$KeyResultCopyWith(
          _KeyResult value, $Res Function(_KeyResult) then) =
      __$KeyResultCopyWithImpl<$Res>;
  @override
  $Res call({String title, double progress});
}

/// @nodoc
class __$KeyResultCopyWithImpl<$Res> extends _$KeyResultCopyWithImpl<$Res>
    implements _$KeyResultCopyWith<$Res> {
  __$KeyResultCopyWithImpl(_KeyResult _value, $Res Function(_KeyResult) _then)
      : super(_value, (v) => _then(v as _KeyResult));

  @override
  _KeyResult get _value => super._value as _KeyResult;

  @override
  $Res call({
    Object title = freezed,
    Object progress = freezed,
  }) {
    return _then(_KeyResult(
      title == freezed ? _value.title : title as String,
      progress == freezed ? _value.progress : progress as double,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_KeyResult with DiagnosticableTreeMixin implements _KeyResult {
  const _$_KeyResult(this.title, this.progress)
      : assert(title != null),
        assert(progress != null);

  factory _$_KeyResult.fromJson(Map<String, dynamic> json) =>
      _$_$_KeyResultFromJson(json);

  @override
  final String title;
  @override
  final double progress;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'KeyResult(title: $title, progress: $progress)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'KeyResult'))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('progress', progress));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _KeyResult &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.progress, progress) ||
                const DeepCollectionEquality()
                    .equals(other.progress, progress)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(progress);

  @override
  _$KeyResultCopyWith<_KeyResult> get copyWith =>
      __$KeyResultCopyWithImpl<_KeyResult>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_KeyResultToJson(this);
  }
}

abstract class _KeyResult implements KeyResult {
  const factory _KeyResult(String title, double progress) = _$_KeyResult;

  factory _KeyResult.fromJson(Map<String, dynamic> json) =
      _$_KeyResult.fromJson;

  @override
  String get title;
  @override
  double get progress;
  @override
  _$KeyResultCopyWith<_KeyResult> get copyWith;
}

Objective _$ObjectiveFromJson(Map<String, dynamic> json) {
  return _Objective.fromJson(json);
}

/// @nodoc
class _$ObjectiveTearOff {
  const _$ObjectiveTearOff();

// ignore: unused_element
  _Objective call(
      String id, int sortIndex, String title, List<KeyResult> keyResults) {
    return _Objective(
      id,
      sortIndex,
      title,
      keyResults,
    );
  }

// ignore: unused_element
  Objective fromJson(Map<String, Object> json) {
    return Objective.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $Objective = _$ObjectiveTearOff();

/// @nodoc
mixin _$Objective {
  String get id;
  int get sortIndex;
  String get title;
  List<KeyResult> get keyResults;

  Map<String, dynamic> toJson();
  $ObjectiveCopyWith<Objective> get copyWith;
}

/// @nodoc
abstract class $ObjectiveCopyWith<$Res> {
  factory $ObjectiveCopyWith(Objective value, $Res Function(Objective) then) =
      _$ObjectiveCopyWithImpl<$Res>;
  $Res call(
      {String id, int sortIndex, String title, List<KeyResult> keyResults});
}

/// @nodoc
class _$ObjectiveCopyWithImpl<$Res> implements $ObjectiveCopyWith<$Res> {
  _$ObjectiveCopyWithImpl(this._value, this._then);

  final Objective _value;
  // ignore: unused_field
  final $Res Function(Objective) _then;

  @override
  $Res call({
    Object id = freezed,
    Object sortIndex = freezed,
    Object title = freezed,
    Object keyResults = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as String,
      sortIndex: sortIndex == freezed ? _value.sortIndex : sortIndex as int,
      title: title == freezed ? _value.title : title as String,
      keyResults: keyResults == freezed
          ? _value.keyResults
          : keyResults as List<KeyResult>,
    ));
  }
}

/// @nodoc
abstract class _$ObjectiveCopyWith<$Res> implements $ObjectiveCopyWith<$Res> {
  factory _$ObjectiveCopyWith(
          _Objective value, $Res Function(_Objective) then) =
      __$ObjectiveCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id, int sortIndex, String title, List<KeyResult> keyResults});
}

/// @nodoc
class __$ObjectiveCopyWithImpl<$Res> extends _$ObjectiveCopyWithImpl<$Res>
    implements _$ObjectiveCopyWith<$Res> {
  __$ObjectiveCopyWithImpl(_Objective _value, $Res Function(_Objective) _then)
      : super(_value, (v) => _then(v as _Objective));

  @override
  _Objective get _value => super._value as _Objective;

  @override
  $Res call({
    Object id = freezed,
    Object sortIndex = freezed,
    Object title = freezed,
    Object keyResults = freezed,
  }) {
    return _then(_Objective(
      id == freezed ? _value.id : id as String,
      sortIndex == freezed ? _value.sortIndex : sortIndex as int,
      title == freezed ? _value.title : title as String,
      keyResults == freezed ? _value.keyResults : keyResults as List<KeyResult>,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_Objective with DiagnosticableTreeMixin implements _Objective {
  const _$_Objective(this.id, this.sortIndex, this.title, this.keyResults)
      : assert(id != null),
        assert(sortIndex != null),
        assert(title != null),
        assert(keyResults != null);

  factory _$_Objective.fromJson(Map<String, dynamic> json) =>
      _$_$_ObjectiveFromJson(json);

  @override
  final String id;
  @override
  final int sortIndex;
  @override
  final String title;
  @override
  final List<KeyResult> keyResults;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Objective(id: $id, sortIndex: $sortIndex, title: $title, keyResults: $keyResults)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Objective'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('sortIndex', sortIndex))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('keyResults', keyResults));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Objective &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.sortIndex, sortIndex) ||
                const DeepCollectionEquality()
                    .equals(other.sortIndex, sortIndex)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.keyResults, keyResults) ||
                const DeepCollectionEquality()
                    .equals(other.keyResults, keyResults)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(sortIndex) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(keyResults);

  @override
  _$ObjectiveCopyWith<_Objective> get copyWith =>
      __$ObjectiveCopyWithImpl<_Objective>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ObjectiveToJson(this);
  }
}

abstract class _Objective implements Objective {
  const factory _Objective(
          String id, int sortIndex, String title, List<KeyResult> keyResults) =
      _$_Objective;

  factory _Objective.fromJson(Map<String, dynamic> json) =
      _$_Objective.fromJson;

  @override
  String get id;
  @override
  int get sortIndex;
  @override
  String get title;
  @override
  List<KeyResult> get keyResults;
  @override
  _$ObjectiveCopyWith<_Objective> get copyWith;
}

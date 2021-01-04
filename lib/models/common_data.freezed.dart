// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'common_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;
FlexTheme _$FlexThemeFromJson(Map<String, dynamic> json) {
  return _FlexTheme.fromJson(json);
}

/// @nodoc
class _$FlexThemeTearOff {
  const _$FlexThemeTearOff();

// ignore: unused_element
  _FlexTheme call({@required ThemeMode themeMode, @required int themeIndex}) {
    return _FlexTheme(
      themeMode: themeMode,
      themeIndex: themeIndex,
    );
  }

// ignore: unused_element
  FlexTheme fromJson(Map<String, Object> json) {
    return FlexTheme.fromJson(json);
  }
}

/// @nodoc
// ignore: unused_element
const $FlexTheme = _$FlexThemeTearOff();

/// @nodoc
mixin _$FlexTheme {
  ThemeMode get themeMode;
  int get themeIndex;

  Map<String, dynamic> toJson();
  $FlexThemeCopyWith<FlexTheme> get copyWith;
}

/// @nodoc
abstract class $FlexThemeCopyWith<$Res> {
  factory $FlexThemeCopyWith(FlexTheme value, $Res Function(FlexTheme) then) =
      _$FlexThemeCopyWithImpl<$Res>;
  $Res call({ThemeMode themeMode, int themeIndex});
}

/// @nodoc
class _$FlexThemeCopyWithImpl<$Res> implements $FlexThemeCopyWith<$Res> {
  _$FlexThemeCopyWithImpl(this._value, this._then);

  final FlexTheme _value;
  // ignore: unused_field
  final $Res Function(FlexTheme) _then;

  @override
  $Res call({
    Object themeMode = freezed,
    Object themeIndex = freezed,
  }) {
    return _then(_value.copyWith(
      themeMode:
          themeMode == freezed ? _value.themeMode : themeMode as ThemeMode,
      themeIndex: themeIndex == freezed ? _value.themeIndex : themeIndex as int,
    ));
  }
}

/// @nodoc
abstract class _$FlexThemeCopyWith<$Res> implements $FlexThemeCopyWith<$Res> {
  factory _$FlexThemeCopyWith(
          _FlexTheme value, $Res Function(_FlexTheme) then) =
      __$FlexThemeCopyWithImpl<$Res>;
  @override
  $Res call({ThemeMode themeMode, int themeIndex});
}

/// @nodoc
class __$FlexThemeCopyWithImpl<$Res> extends _$FlexThemeCopyWithImpl<$Res>
    implements _$FlexThemeCopyWith<$Res> {
  __$FlexThemeCopyWithImpl(_FlexTheme _value, $Res Function(_FlexTheme) _then)
      : super(_value, (v) => _then(v as _FlexTheme));

  @override
  _FlexTheme get _value => super._value as _FlexTheme;

  @override
  $Res call({
    Object themeMode = freezed,
    Object themeIndex = freezed,
  }) {
    return _then(_FlexTheme(
      themeMode:
          themeMode == freezed ? _value.themeMode : themeMode as ThemeMode,
      themeIndex: themeIndex == freezed ? _value.themeIndex : themeIndex as int,
    ));
  }
}

@JsonSerializable()

/// @nodoc
class _$_FlexTheme with DiagnosticableTreeMixin implements _FlexTheme {
  const _$_FlexTheme({@required this.themeMode, @required this.themeIndex})
      : assert(themeMode != null),
        assert(themeIndex != null);

  factory _$_FlexTheme.fromJson(Map<String, dynamic> json) =>
      _$_$_FlexThemeFromJson(json);

  @override
  final ThemeMode themeMode;
  @override
  final int themeIndex;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FlexTheme(themeMode: $themeMode, themeIndex: $themeIndex)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FlexTheme'))
      ..add(DiagnosticsProperty('themeMode', themeMode))
      ..add(DiagnosticsProperty('themeIndex', themeIndex));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FlexTheme &&
            (identical(other.themeMode, themeMode) ||
                const DeepCollectionEquality()
                    .equals(other.themeMode, themeMode)) &&
            (identical(other.themeIndex, themeIndex) ||
                const DeepCollectionEquality()
                    .equals(other.themeIndex, themeIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(themeMode) ^
      const DeepCollectionEquality().hash(themeIndex);

  @override
  _$FlexThemeCopyWith<_FlexTheme> get copyWith =>
      __$FlexThemeCopyWithImpl<_FlexTheme>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FlexThemeToJson(this);
  }
}

abstract class _FlexTheme implements FlexTheme {
  const factory _FlexTheme(
      {@required ThemeMode themeMode, @required int themeIndex}) = _$_FlexTheme;

  factory _FlexTheme.fromJson(Map<String, dynamic> json) =
      _$_FlexTheme.fromJson;

  @override
  ThemeMode get themeMode;
  @override
  int get themeIndex;
  @override
  _$FlexThemeCopyWith<_FlexTheme> get copyWith;
}

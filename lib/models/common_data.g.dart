// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'common_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FlexTheme _$_$_FlexThemeFromJson(Map<String, dynamic> json) {
  return _$_FlexTheme(
    themeMode: _$enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']),
    themeIndex: json['themeIndex'] as int,
  );
}

Map<String, dynamic> _$_$_FlexThemeToJson(_$_FlexTheme instance) =>
    <String, dynamic>{
      'themeMode': _$ThemeModeEnumMap[instance.themeMode],
      'themeIndex': instance.themeIndex,
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};

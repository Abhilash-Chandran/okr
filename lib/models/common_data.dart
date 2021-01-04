import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
part 'common_data.freezed.dart';
part 'common_data.g.dart';

@freezed
abstract class FlexTheme with _$FlexTheme {
  const factory FlexTheme({
    @required ThemeMode themeMode,
    @required int themeIndex,
  }) = _FlexTheme;
  factory FlexTheme.fromJson(Map<String, dynamic> json) =>
      _$FlexThemeFromJson(json);
}

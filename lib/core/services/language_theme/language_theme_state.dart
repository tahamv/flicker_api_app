import 'package:flicker_api_app/core/config/locale/locale_configs.dart';
import 'package:flicker_api_app/core/config/theme/app_theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_theme_state.freezed.dart';

@freezed
class ThemeAndLanguageState with _$ThemeAndLanguageState {
  const factory ThemeAndLanguageState.idle() = ThemeAndLanguageStateIdle;

  const factory ThemeAndLanguageState.success({ThemeType? themeType, LanguageType? languageType}) =
      ThemeAndLanguageStateSuccess;

  const factory ThemeAndLanguageState.failed(String message) = ThemeAndLanguageStateFailed;
}

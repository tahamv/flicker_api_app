import 'package:flicker_api_app/core/config/locale/locale_configs.dart';
import 'package:flicker_api_app/core/config/theme/app_theme.dart';
import 'package:flicker_api_app/core/services/language_theme/language_theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThemeAndLanguageCubit extends Cubit<ThemeAndLanguageState> {
  ThemeData? _themeData;
  ThemeType? _themeType;
  Locale? _locale;

  Locale? get locale => _locale;

  LanguageType? _languageType;

  ThemeData? get themeData => _themeData;

  ThemeAndLanguageCubit() : super(const ThemeAndLanguageState.idle()) {
    _locale = Locale(LanguageType.en.name);
    _languageType = LanguageType.en;
    _themeData = ThemeData.light().theme(_locale?.languageCode);
    _themeType = ThemeType.light;
  }

  void changeTheme({ThemeType? manualSelectThemeType}) {
    if (manualSelectThemeType != null) {
      _themeType = manualSelectThemeType;
    } else {
      _themeType = ThemeType.values.where((element) => element.name != _themeType!.name).first;
    }
    switch (_themeType!) {
      case ThemeType.dark:
        _themeData = ThemeData.dark().theme(_locale?.languageCode);
        break;
      case ThemeType.light:
        _themeData = ThemeData.light().theme(_locale?.languageCode);
        break;
    }

    emit(ThemeAndLanguageState.success(themeType: _themeType, languageType: _languageType));
  }

  void changeLanguage({LanguageType? manualSelectLanguageType}) {
    if (manualSelectLanguageType != null) {
      _languageType = manualSelectLanguageType;
    } else {
      _languageType = LanguageType.values.where((element) => element.name != _languageType!.name).first;
    }
    switch (_languageType) {
      case LanguageType.en:
        _locale = Locale(LanguageType.en.name);
        break;
      case LanguageType.fa:
        _locale = Locale(LanguageType.fa.name);
        break;
      default:
        _locale = Locale(LanguageType.en.name);
        break;
    }
    switch (_themeType!) {
      case ThemeType.dark:
        _themeData = ThemeData.dark().theme(_locale?.languageCode);
        break;
      case ThemeType.light:
        _themeData = ThemeData.light().theme(_locale?.languageCode);
        break;
    }
    emit(ThemeAndLanguageState.success(themeType: _themeType, languageType: _languageType));
  }
}

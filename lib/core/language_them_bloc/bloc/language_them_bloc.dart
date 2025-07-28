import 'package:bloc_demo_project/core/language_them_bloc/event/language_them_event.dart';
import 'package:bloc_demo_project/core/language_them_bloc/state/language_them_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_demo_project/core/constants/app_strings.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../../constants/app_fonts.dart' show AppFonts;

enum ThemeEvent { toggleDark, toggleLight }

enum LanguageTypes {
  en('en', 'US', AppFonts.degular),
  km('km', 'KH', AppFonts.degular),
  ja('ja', 'JP', AppFonts.degular);

  final String languageCode;
  final String countryCode;
  final String fontFamily;
  const LanguageTypes(this.languageCode, this.countryCode, this.fontFamily);
}

mixin MapLocaleList {
  static final types = [
    MapLocale(
      LanguageTypes.en.name,
      AppStrings.EN,
      countryCode: LanguageTypes.en.countryCode,
      fontFamily: LanguageTypes.en.fontFamily,
    ),
    MapLocale(
      LanguageTypes.km.name,
      AppStrings.KM,
      countryCode: LanguageTypes.km.countryCode,
      fontFamily: LanguageTypes.km.fontFamily,
    ),
    MapLocale(
      LanguageTypes.ja.name,
      AppStrings.JA,
      countryCode: LanguageTypes.ja.countryCode,
      fontFamily: LanguageTypes.ja.fontFamily,
    ),
  ];
}

class LanguageThemBloc extends Bloc<LanguageThemEvent, LanguageThemState> {
  LanguageThemBloc() : super(const LanguageThemState()) {
    on<LanguageThemEvent>((event, emit) async {
      await event.when(
        initial: (languageType, isThemChange) async {
          emit(
            state.copyWith(
              languageCode: languageType,
              themeEvent: isThemChange,
            ),
          );
        },
        onChangeLanguage: (languageType) async {
          emit(state.copyWith(languageCode: languageType));
        },
        isLoggedInStatusChanged: (isLoggedIn) async {
          emit(state.copyWith(isLoggedIn: isLoggedIn));
        },
        isThemStatusChanged: (isThemChange) async {
          final themeEvent =
              isThemChange ? ThemeEvent.toggleLight : ThemeEvent.toggleDark;
          emit(state.copyWith(themeEvent: themeEvent));
        },
      );
    });
  }
}

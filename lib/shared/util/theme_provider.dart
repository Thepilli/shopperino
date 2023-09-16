import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'theme_provider.g.dart';

@riverpod
class DarkThemeSwitch extends _$DarkThemeSwitch {
  @override
  bool build() {
    return false;
  }

  void switchTheme() {
    state = !state;
  }
}

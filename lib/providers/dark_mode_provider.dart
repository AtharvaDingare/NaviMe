import 'package:flutter_riverpod/flutter_riverpod.dart';

class DarkModeStateNotifier extends StateNotifier<bool> {
  DarkModeStateNotifier() : super(true);

  void changeState(bool newState) {
    state = newState;
  }
}

final darkmodestateprovider =
    StateNotifierProvider<DarkModeStateNotifier, bool>(
        (ref) => DarkModeStateNotifier());

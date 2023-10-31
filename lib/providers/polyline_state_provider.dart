import 'package:flutter_riverpod/flutter_riverpod.dart';

class PolylineStateNotifier extends StateNotifier<bool> {
  PolylineStateNotifier() : super(false);

  void changeState(bool newState) {
    state = newState;
  }
}

final polylinestateprovider =
    StateNotifierProvider<PolylineStateNotifier, bool>(
        (ref) => PolylineStateNotifier());

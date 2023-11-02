import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchBoxListNotifier extends StateNotifier<List<Widget>> {
  SearchBoxListNotifier() : super([]);

  void insertitem(Widget searchbar) {
    state = [...state, searchbar];
  }

  void deleteitem(Widget searchBar) {
    List<Widget> newState = [];
    for (int i = 0; i < state.length; i++) {
      if (state[i] != searchBar) {
        newState.add(state[i]);
      }
    }
    state = newState;
  }
}

final searchboxlistprovider =
    StateNotifierProvider<SearchBoxListNotifier, List<Widget>>(
        (ref) => SearchBoxListNotifier());

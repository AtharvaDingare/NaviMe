import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapMarkersNotifier extends StateNotifier<List<Marker>> {
  MapMarkersNotifier() : super([]);

  void addMarker(Marker marker) {
    state = [...state, marker];
  }

  void removeMarker(Marker marker) {
    List<Marker> markers = state;
    if (markers.contains(marker)) {
      markers.remove(markers);
    }
    state = markers;
  }
}

final mapMarkersProvider =
    StateNotifierProvider<MapMarkersNotifier, List<Marker>>(
        (ref) => MapMarkersNotifier());

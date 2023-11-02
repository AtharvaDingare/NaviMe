import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latlong2/latlong.dart';
import 'package:traveling_salesman/providers/markers_providers.dart';
import 'package:traveling_salesman/providers/polyline_state_provider.dart';
import 'package:traveling_salesman/TSP/tsp.dart';

class MyDearMap extends ConsumerStatefulWidget {
  const MyDearMap({super.key});

  @override
  ConsumerState<MyDearMap> createState() => _MyDearMapState();
}

class _MyDearMapState extends ConsumerState<MyDearMap> {
  List<LatLng> polylinepoints = [];
  @override
  Widget build(BuildContext context) {
    List<Marker> marker = ref.watch(mapMarkersProvider);
    bool polylinestate = ref.watch(polylinestateprovider);
    void oncomputationrequest() {
      var salesman = Tsp(markers: marker);
      polylinepoints = salesman.travelthesalesman();
      print(polylinepoints);
      ref.read(polylinestateprovider.notifier).changeState(true);
    }

    //bool isDarkMode = ref.watch(darkmodestateprovider);
    return Stack(
      children: [
        FlutterMap(
          options: MapOptions(
            initialCenter: const LatLng(
                18.457578758734435, 73.850820556788), // initial coordinates
            initialZoom: 16.0,
            onTap: (TapPosition tapPosition, LatLng latLng) {
              ref.read(mapMarkersProvider.notifier).addMarker(
                    Marker(
                      point: latLng,
                      child: Icon(Icons.pin_drop,
                          color: marker.isEmpty
                              ? const Color.fromARGB(255, 134, 12, 3)
                              : Colors.black),
                    ),
                  );
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              userAgentPackageName: 'com.example.app',
            ),
            MarkerLayer(markers: marker),
            if (polylinestate)
              PolylineLayer(
                polylines: [
                  Polyline(
                    points: polylinepoints,
                    strokeWidth: 5.0,
                    color: const Color.fromARGB(255, 9, 115, 202),
                  ),
                ],
              ),
          ],
        ),
        Positioned(
          bottom: 45,
          left: 16,
          right: 16,
          height: 40,
          child: ElevatedButton(
            onPressed: () {
              oncomputationrequest();
            },
            style: const ButtonStyle(
              elevation: MaterialStatePropertyAll(3.0),
              backgroundColor: MaterialStatePropertyAll(Colors.black),
            ),
            child: const Text(
              "COMPUTE !!",
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}

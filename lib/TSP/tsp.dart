import 'dart:math';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';

class Tsp {
  late int count;
  late List<List<double>> graph;
  Tsp({required this.markers}) {
    count = markers.length;
    graph = List.generate(count, (index) => []);
  }
  final List<Marker> markers;

  double finddistance(Marker m1, Marker m2) {
    double distance = Geolocator.distanceBetween(m1.point.latitude,
        m1.point.longitude, m2.point.latitude, m2.point.longitude);
    return distance;
  }

  double recursetsp(List<List<double>> graph, int mask, int node, int n,
      List<List<double>> dp, List<List<int>> parents, List<int> powers) {
    if (dp[node][mask] != -1) {
      return dp[node][mask];
    }
    if (mask == (powers[n] - 1)) {
      parents[node][mask] = 0;
      return dp[node][mask] = graph[node][0];
    }
    double mindistance = 1000000000;
    for (int i = 0; i < n; i++) {
      if ((mask & powers[i]) == powers[i]) {
        continue;
      } else {
        double prevdistance = mindistance;
        mindistance = min(
            mindistance,
            recursetsp(graph, mask | powers[i], i, n, dp, parents, powers) +
                graph[node][i]);
        if (mindistance < prevdistance) {
          parents[node][mask] = i;
        }
      }
    }

    return dp[node][mask] = mindistance;
  }

  List<LatLng> travelthesalesman() {
    for (int i = 0; i < count; i++) {
      for (int j = 0; j < count; j++) {
        graph[i].add(finddistance(markers[i], markers[j]));
      }
    }
    print(graph);
    List<int> powers = [];
    int temp = 1;
    for (int i = 0; i < 20; i++) {
      powers.add(temp);
      temp = temp * 2;
    }
    List<List<double>> dp =
        List.generate(count, (index) => List.filled(powers[count], -1));
    List<List<int>> parents =
        List.generate(count, (index) => List.filled(powers[count], -1));
    double answer = recursetsp(graph, 1, 0, count, dp, parents, powers);
    print(answer);
    List<int> path = [];
    List<LatLng> plotpath = [];
    int snode = 0, smask = 1;
    while (true) {
      path.add(snode);
      plotpath.add(markers[snode].point);
      snode = parents[snode][smask];
      smask = smask | powers[snode];
      if (snode == 0) {
        path.add(snode);
        plotpath.add(markers[snode].point);
        break;
      }
    }
    return plotpath;
  }
}

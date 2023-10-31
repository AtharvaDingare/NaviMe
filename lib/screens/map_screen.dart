import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traveling_salesman/widgets/map.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 109, 183, 243),
              Color.fromARGB(255, 136, 189, 233),
              Color.fromARGB(255, 151, 191, 224),
            ],
          ),
        ),
        child: const MyDearMap(),
      ),
    );
  }
}

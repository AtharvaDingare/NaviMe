import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traveling_salesman/screens/homescreen.dart';
import 'package:traveling_salesman/screens/map_screen.dart';

void main() {
  runApp(const ProviderScope(child: App()));
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home' : (context) => const HomeScreen(),
        '/map' :(context) => const MapScreen(),
      },
      home: const HomeScreen(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:traveling_salesman/screens/map_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    void NavigatetoMap() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MapScreen(),
        ),
      );
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 109, 183, 243),
              Color.fromARGB(255, 136, 189, 233),
              Color.fromARGB(255, 151, 191, 224)
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/world_map.jpeg"),
            ),
            const SizedBox(
              height: 250,
            ),
            ElevatedButton(
              onPressed: () {
                NavigatetoMap();
              },
              child: const Text("Navigate furtherr!!"),
            ),
          ],
        ),
      ),
    );
  }
}

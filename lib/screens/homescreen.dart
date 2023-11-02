import 'package:flutter/material.dart';
import 'package:traveling_salesman/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("SOME DATA"),
        backgroundColor: Colors.transparent,
        actions: const [],
      ),
      drawer: const CustomDrawer(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black87,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: kToolbarHeight + 5,
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Image.asset(
                "assets/world_map.jpeg",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 250,
            ),
          ],
        ),
      ),
    );
  }
}

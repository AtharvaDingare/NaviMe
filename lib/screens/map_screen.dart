import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:traveling_salesman/providers/search_box_list_provider.dart';
import 'package:traveling_salesman/widgets/drawer.dart';
import 'package:traveling_salesman/widgets/map.dart';
import 'package:traveling_salesman/widgets/search_tile.dart';

class MapScreen extends ConsumerWidget {
  const MapScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Widget> searchbars = ref.watch(searchboxlistprovider);
    void addLocation() {
      const search = MySearchBar();
      ref.read(searchboxlistprovider.notifier).insertitem(search);
    }
    
    void showDarkModalSheet(BuildContext context) {
      showModalBottomSheet<void>(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey[900], // Dark background color
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            child: ListView(
              children: <Widget>[
                Container(
                  height: 5, // Handle bar height
                  width: 50, // Handle bar width
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey[400], // Handle bar color
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Dark Modal Sheet Content',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Text color
                    ),
                  ),
                ),
                // Add your content widgets here
                ...searchbars,
                Center(
                  child: IconButton(
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      fill: 1.0,
                    ),
                    onPressed: () {
                      addLocation();
                    },
                  ),
                ),
                // ...
              ],
            ),
          );
        },
      );
    }

    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Map Screen",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            color: Colors.black,
            onPressed: () {
              showDarkModalSheet(context);
            },
            iconSize: (MediaQuery.of(context).size.height * 40) / screenHeight,
          )
        ],
      ),
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
      drawer: const CustomDrawer(),
    );
  }
}

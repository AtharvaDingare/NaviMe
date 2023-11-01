import 'package:flutter/material.dart';
import 'package:traveling_salesman/screens/map_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});
  @override
  Widget build(BuildContext context) {
    void navigatetoMap() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const MapScreen(),
        ),
      );
    }

    void navigatetoHome() {
      // how to check the current route ??
      final currentRoute = ModalRoute.of(context)!.settings.name;
      if (currentRoute == '/home') {
        Navigator.popUntil(context, (route) => route.isFirst);
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          '/home',
          (route) => false,
        );
      }
    }

    return Drawer(
      child: Container(
        color: Colors.black87, // Customize the background color
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              accountName: Text('John Doe'), // Customize the user's name
              accountEmail:
                  Text('johndoe@example.com'), // Customize the user's email
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.brown,
                // Customize the profile image
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home,
                  color: Colors.white), // Customize the icon
              title: const Text('Home',
                  style: TextStyle(color: Colors.white)), // Customize the text
              onTap: () {
                navigatetoHome();
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on,
                  color: Colors.white), // Customize the icon
              title: const Text('Select Route',
                  style: TextStyle(color: Colors.white)), // Customize the text
              onTap: () {
                navigatetoMap(); // this navigates you to the map screen
              },
            ),
            ListTile(
              leading: const Icon(Icons.search,
                  color: Colors.white), // Customize the icon
              title: const Text('Search',
                  style: TextStyle(color: Colors.white)), // Customize the text
              onTap: () {
                // Handle the Search option
              },
            ),
            const Divider(
                color: Colors
                    .white), // Add a divider that divides the drawer into two segments (pretty useful widget!!)
            ListTile(
              leading: const Icon(Icons.settings,
                  color: Colors.white), // Customize the icon
              title: const Text('Settings',
                  style: TextStyle(color: Colors.white)), // Customize the text
              onTap: () {
                // Handle the Settings option
              },
            ),
          ],
        ),
      ),
    );
  }
}

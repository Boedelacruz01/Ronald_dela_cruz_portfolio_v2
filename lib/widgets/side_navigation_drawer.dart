import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SideNavigationDrawer extends StatelessWidget {
  const SideNavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 12),
        children: [
          _navTile('Home', Icons.home, '/'),
          _navTile('About Me', Icons.person, '/about'),
          _navTile('Skills', Icons.code, '/skills'),
          _navTile('Experience', Icons.work, '/experience'),
          _navTile('Projects', Icons.mobile_friendly, '/projects'),
          _navTile('Contact', Icons.mail, '/contact'),
        ],
      ),
    );
  }

  Widget _navTile(String title, IconData icon, String route) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        // Close the drawer first
        Get.back();

        // Only navigate if we're not already on the target route
        if (Get.currentRoute != route) {
          Get.toNamed(route);
        }
      },
    );
  }
}

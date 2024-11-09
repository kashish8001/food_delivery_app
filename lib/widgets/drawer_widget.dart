// lib/widgets/drawer_widget.dart

import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("John Doe"),
            accountEmail: Text("johndoe@example.com"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/user_avatar.png"),
            ),
            decoration: BoxDecoration(
              color: Colors.red,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/home");
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text("My Cart"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/cart");
            },
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text("Order History"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/history");
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/profile");
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/settings");
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/login");
            },
          ),
        ],
      ),
    );
  }
}

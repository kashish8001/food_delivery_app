// lib/widgets/app_bar_widget.dart

import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      title: const Text("My Cart"),
      backgroundColor: Colors.blue,
      elevation: 0,
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {
            // Handle notification action
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

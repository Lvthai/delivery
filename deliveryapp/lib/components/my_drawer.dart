import 'package:deliveryapp/components/my_drawer_tile.dart';
import 'package:deliveryapp/pages/settings_pages.dart';
import 'package:deliveryapp/service/auth/auth_service.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_clock_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          //home list
          MyDrawerTile(
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
            text: "Trang Chủ",
          ),

          MyDrawerTile(
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
            text: "Cài Đặt",
          ),

          const Spacer(),

          MyDrawerTile(
            icon: Icons.logout,
            onTap: () {
              logout();
              Navigator.pop(context);
            },
            text: "Đăng Xuất",
          ),
          const SizedBox(height: 25.0),
        ],
      ),
    );
  }
}

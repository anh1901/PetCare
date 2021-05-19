import 'package:flutter/material.dart';
import 'package:petcare/screens/home_screen/home_screen.dart';
import 'package:petcare/screens/notifications_screen/notification_screen.dart';
import 'package:petcare/screens/pets_screen/pets_screen.dart';
import 'package:petcare/screens/profile_screen/profile_screen.dart';
import 'package:petcare/screens/shopping_screen/shopping_screen.dart';

class ChildWidget extends StatelessWidget {
  final AvailableMenu menu;

  const ChildWidget({Key key, this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String screen = "";
    Widget child;
    if (menu == AvailableMenu.Home) {
      screen = "Home";
      child = HomeScreen();
    } else if (menu == AvailableMenu.Shopping) {
      screen = "Shopping";
      child = ShoppingScreen();
    } else if (menu == AvailableMenu.Pets) {
      screen = "Pets";
      child = PetsScreen();
    } else if (menu == AvailableMenu.Notifications) {
      screen = "Notifications";
      child = NotificationsScreen();
    } else {
      screen = "Profile";
      child = ProfileScreen();
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
    );
  }
}

enum AvailableMenu { Home, Shopping, Pets, Profile, Notifications }

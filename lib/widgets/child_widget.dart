import 'package:flutter/material.dart';

import 'custom_text.dart';

class ChildWidget extends StatelessWidget {
  final AvailableMenu menu;

  const ChildWidget({Key key, this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String screen = "";
    if (menu == AvailableMenu.Home) {
      screen = "Home";
    } else if (menu == AvailableMenu.Shopping) {
      screen = "Shopping";
    } else if (menu == AvailableMenu.Pets) {
      screen = "Pets";
    } else {
      screen = "Profile";
    }

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomText(
              text: "$screen screen",
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}

enum AvailableMenu { Home, Shopping, Pets, Profile }

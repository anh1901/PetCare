import 'package:flutter/material.dart';
import 'package:petcare/screens/home_screen.dart';
import 'package:petcare/screens/pets_screen.dart';
import 'package:petcare/screens/profile_screen.dart';
import 'package:petcare/screens/shopping_screen.dart';

import 'block/block_provider.dart';
import 'block/home_block.dart';
import 'block/pets_block.dart';
import 'block/profile_block.dart';
import 'block/shopping_block.dart';

class AppBody extends StatefulWidget {
  final int currentItem;
  AppBody({Key key, this.currentItem}) : super(key: key);

  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    switch (widget.currentItem) {
      case 0:
        return BlockProvider(
          block: HomeBlock(),
          child: HomeScreen(),
        );
      case 1:
        return BlockProvider(
          block: ShoppingBlock(),
          child: ShoppingScreen(),
        );
      case 2:
        return BlockProvider(
          block: PetsBlock(),
          child: PetsScreen(),
        );
      case 3:
        return BlockProvider(
          block: ProfileBlock(),
          child: ProfileScreen(),
        );
    }
    throw Exception('Invalid page.');
  }
}

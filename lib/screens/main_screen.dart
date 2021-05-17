import 'package:flutter/material.dart';
import 'package:petcare/widgets/app_body.dart';
import 'package:petcare/widgets/commons.dart';
import 'package:petcare/widgets/custom_text.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentItem = 0;
  void _onSelectItem(int selectedItem) {
    setState(() {
      _currentItem = selectedItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBody(
        currentItem: _currentItem,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentItem,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined, color: black),
            title: CustomText(text: 'Home', color: black),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined, color: black),
            title: CustomText(text: 'Shopping', color: black),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets_outlined, color: black),
            title: CustomText(text: 'Pets', color: black),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_outlined, color: black),
            title: CustomText(text: 'Profile', color: black),
          ),
        ],
        onTap: _onSelectItem,
      ),
    );
  }
}

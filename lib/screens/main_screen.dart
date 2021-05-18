import 'package:flutter/material.dart';
import 'package:petcare/widgets/child_widget.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  PageController _pageController = PageController(
    initialPage: 0,
  );
  int currentIndex = 0;

  Widget childWidget = ChildWidget(
    menu: AvailableMenu.Home,
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[500],
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;
          _pageController.animateToPage(
            value,
            duration: Duration(milliseconds: 200),
            curve: Curves.linear,
          );
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            title: Text("Shopping"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pets),
            title: Text("Pets"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity_outlined),
            title: Text("Profile"),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: (page) {
          setState(() {
            currentIndex = page;
          });
        },
        children: <Widget>[
          ChildWidget(menu: AvailableMenu.Home),
          ChildWidget(menu: AvailableMenu.Shopping),
          ChildWidget(menu: AvailableMenu.Pets),
          ChildWidget(menu: AvailableMenu.Profile),
        ],
      ),
    );
  }
}

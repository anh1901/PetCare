import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:double_back_to_close_app/double_back_to_close_app.dart';
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
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.fixedCircle,
        color: Colors.white70,
        backgroundColor: Colors.blueAccent,
        height: 62,
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
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.shopping_cart, title: 'Shopping'),
          TabItem(icon: Icons.pets, title: 'Pets'),
          TabItem(icon: Icons.notifications, title: 'News'),
          TabItem(icon: Icons.perm_identity, title: 'Profile'),
        ],
        initialActiveIndex: 2,
      ),
      body: DoubleBackToCloseApp(
        child: PageView(
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
            ChildWidget(menu: AvailableMenu.Notifications),
            ChildWidget(menu: AvailableMenu.Profile),
          ],
        ),
        snackBar: SnackBar(
          content: SizedBox(child: Text('Tap back again to leave')),
          backgroundColor: Colors.black26,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(bottom: 70, left: 10.0, right: 10.0),
        ),
      ),
    );
  }
}

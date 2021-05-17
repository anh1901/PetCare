import 'package:flutter/material.dart';
import 'package:petcare/screens/main_screen.dart';

import 'data/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      title: 'Pet Care - Ứng dụng chăm sóc thú cưng',
      home: MainScreen(),
    );
  }
}

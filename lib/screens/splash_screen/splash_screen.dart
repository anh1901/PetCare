import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petcare/widgets/commons.dart';
import 'package:petcare/widgets/size_config.dart';

import '../main_screen.dart';
import 'components/splash_body.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 4),
      () => {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (BuildContext context) => MainScreen(),
          ),
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: white,
      body: SplashBody(),
    );
  }
}

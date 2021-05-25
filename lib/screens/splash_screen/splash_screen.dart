import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petcare/caches/shared_storage.dart';
import 'package:petcare/screens/login_screen/login_screen.dart';
import 'package:petcare/utils/function_util.dart';
import 'package:petcare/widgets/commons.dart';
import 'package:petcare/widgets/size_config.dart';

import '../basic_screen/basic_screen.dart';
import 'components/splash_body.dart';

class SplashScreen extends StatefulWidget {
  static final String routerName = 'splash';
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
            builder: (BuildContext context) =>
                SharedStorage.showLogin ? BasicScreen() : LoginScreen(),
          ),
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: ColorStyles.white,
      body: SplashBody(),
    );
  }
}

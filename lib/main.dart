import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:petcare/screens/splash_screen/splash_screen.dart';

import 'data/themes.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('vi', 'VN'),
      ],
      title: 'Pet Care - Ứng dụng chăm sóc thú cưng',
      home: SplashScreen(),
    );
  }
}

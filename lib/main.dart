import 'package:flutter/material.dart';
import 'package:petcare/redux_app.dart';
import 'package:petcare/widgets/app_size.dart';

import 'caches/shared_storage.dart';
import 'config/device_info.dart';
import 'widgets/toast.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SharedStorage.initStorage().then((value) {
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
    Toast.setToastStyle();
  }).catchError((error) {
    print(error);
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeFit.initialize();
    DeviceInfo.initialezed();
    return ReduxApp();
    // return MaterialApp(
    //   theme: lightTheme,
    //   debugShowCheckedModeBanner: false,
    //   localizationsDelegates: [
    //     AppLocalizations.delegate,
    //     GlobalMaterialLocalizations.delegate,
    //     GlobalWidgetsLocalizations.delegate,
    //     GlobalCupertinoLocalizations.delegate,
    //   ],
    //   supportedLocales: [
    //     Locale('en', 'US'),
    //     Locale('vi', 'VN'),
    //   ],
    //   //locale: Locale('en', 'US'),
    //   locale: Locale('vi', 'VN'),
    //   title: 'Pet Care - Ứng dụng chăm sóc thú cưng',
    //   home: SplashScreen(),
    // );
  }
}

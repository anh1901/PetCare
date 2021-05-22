import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:petcare/caches/shared_constant.dart';
import 'package:petcare/caches/shared_storage.dart';
import 'package:petcare/caches/shared_util.dart';
import 'package:petcare/config/common_config.dart';
import 'package:petcare/models/login_info_model.dart';
import 'package:petcare/models/pet_view_model.dart';
import 'package:petcare/models/user_provider.dart';
import 'package:petcare/redux/models/pet_model.dart';
import 'package:petcare/redux/reducer/locale_reducer.dart';
import 'package:petcare/redux/reducer/login_reducer.dart';
import 'package:petcare/redux/reducer/theme_reducer.dart';
import 'package:petcare/redux/reducer/user_reducer.dart';
import 'package:petcare/redux/redux_index.dart';
import 'package:petcare/screens/splash_screen/splash_screen.dart';
import 'package:petcare/widgets/app_theme.dart';
import 'package:petcare/widgets/toast.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

import 'route_util.dart';

class FunctionUtils {
  static Locale curLocale;

  static bool isLogin() {
    LoginInfo loginInfo = SharedStorage.loginInfo;
    if (loginInfo.userId != null && loginInfo.userId > 0) {
      return true;
    }
    return false;
  }

  static void jumpLogin(BuildContext context) {
    Navigator.of(context).pushNamed(SplashScreen.routerName, arguments: '/');
  }

  static void loginOut(BuildContext context) {
    UserProvider userModel = Provider.of<UserProvider>(context, listen: false);
    LoginInfo loginInfo = userModel.loginInfo;
    loginInfo.userId = 0;
    userModel.loginInfo = loginInfo;

    PetViewModel petVM = Provider.of<PetViewModel>(context, listen: false);
    petVM.petList = [];

    Toast.showSuccess('Success!');
    RouteUtil.popRoot(context);
  }

  static void loginOutAction(BuildContext context) {
    Store<ReduxState> store = StoreProvider.of(context);

    store.dispatch(LogoutAction(context));
    store.dispatch(LoginStatusAction(false));
    store.dispatch(UpdatePetList([]));
    store.dispatch(UpdateCurrentPet(PetModel()));

    Toast.showSuccess('Success!');
    RouteUtil.popRoot(context);
  }

  static String formatPhone(account) {
    String phoneStr = account.toString().replaceAll(' ', '');
    if (phoneStr.length > 7 && phoneStr.length <= 11) {
      phoneStr = phoneStr.substring(0, 7) + ' ' + phoneStr.substring(7);
      phoneStr = phoneStr.substring(0, 3) + ' ' + phoneStr.substring(3);
    }
    if (phoneStr.length > 3 && phoneStr.length < 8) {
      phoneStr = phoneStr.substring(0, 3) + ' ' + phoneStr.substring(3);
    }
    return phoneStr;
  }

  static String getPhone(account) {
    return account.toString().replaceAll(' ', '');
  }

  static bool isPhoneNumber(account) {
    final isVietNamMobile = new RegExp(r'^(09|01[2|6|8|9])+([0-9]{8})\b');

    final isOtherTelphone = new RegExp(r'^(170\\d{8}$)');

    if (isVietNamMobile.hasMatch(account)) {
      return true;
    }
    return isOtherTelphone.hasMatch(account);
  }

  static setThemeData(Store store, int index) {
    ThemeData themeData = getThemeData(index);
    store.dispatch(RefreshThemeDataAction(themeData));
    store.dispatch(RefreshNightModalAction(index == 1));
  }

  static getThemeData(int index) {
    List<MaterialColor> colorList = CommonConfig.getThemeColors();
    return AppTheme.appTheme(isNight: index == 1, color: colorList[index]);
  }

  static initThemeData(Store store) async {
    int themeIndex = await SharedUtils.getInt(SharedConstant.themeColorIndex);
    if (themeIndex != null) {
      setThemeData(store, themeIndex);
    }
  }

  static changeLocale(Store store, int index) {
    Locale locale = store.state.platformLocale;
    switch (index) {
      case 0:
        locale = Locale.fromSubtags(languageCode: 'vi');
        break;
      case 1:
        locale = Locale.fromSubtags(languageCode: 'en');
        break;
    }
    curLocale = locale;
    store.dispatch(RefreshLocaleAction(locale));
  }

  static String fillInt(int number) {
    if (number < 10) {
      return '0$number';
    }
    return '$number';
  }
}

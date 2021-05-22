import 'package:flutter/material.dart';
import 'package:petcare/caches/shared_storage.dart';
import 'package:petcare/models/user_data_model.dart';

import 'config_info_model.dart';
import 'login_info_model.dart';

class UserProvider extends ChangeNotifier {
  bool get isLogin {
    if (loginInfo.token != null &&
        loginInfo.token.length > 0 &&
        loginInfo.userId > 0) {
      return true;
    }
    return false;
  }

  ConfigInfo get configInfo {
    return SharedStorage.configInfo;
  }

  LoginInfo get loginInfo {
    return SharedStorage.loginInfo;
  }

  UserData get userData {
    return SharedStorage.userData;
  }

  set configInfo(ConfigInfo configInfo) {
    SharedStorage.configInfo = configInfo;
    notifyListeners();
  }

  set loginInfo(LoginInfo loginInfo) {
    final lastLogin = SharedStorage.loginInfo;
    if (loginInfo?.userId != lastLogin?.userId) {
      SharedStorage.loginInfo?.lastUserId = loginInfo?.userId;
      SharedStorage.loginInfo = loginInfo;
    }
    notifyListeners();
  }

  set userData(UserData userData) {
    SharedStorage.userData = userData;
    notifyListeners();
  }

  UserProvider();

  UserProvider.config(String eventName, String token, int userId) {}
}

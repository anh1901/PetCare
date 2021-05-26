import 'dart:convert';

import 'package:petcare/caches/shared_constant.dart';
import 'package:petcare/caches/shared_util.dart';
import 'package:petcare/models/config_info_model.dart';
import 'package:petcare/models/divice_info_model.dart';
import 'package:petcare/models/login_info_model.dart';
import 'package:petcare/models/user_data_model.dart';
import 'package:petcare/redux/models/pet_model.dart';
import 'package:petcare/redux/reducer/locale_reducer.dart';
import 'package:petcare/redux/reducer/login_reducer.dart';
import 'package:petcare/redux/reducer/user_reducer.dart';
import 'package:petcare/utils/function_util.dart';
import 'package:redux/redux.dart';

import 'data_result.dart';

class SharedStorage {
  static ConfigInfo configInfo = ConfigInfo();
  static LoginInfo loginInfo = LoginInfo();
  static UserData userData = UserData();
  static DeviceInfoModel deviceInfo = DeviceInfoModel();
  static PetModel petModel = PetModel();

  static int currentPetId = 0;
  static bool showWelcome = false;
  static bool showLogin = false;
  static Future initStorage() async {
    showWelcome = await SharedUtils.getBool(SharedConstant.welcomePage);
    showLogin = await SharedUtils.getBool(SharedConstant.isLogin);
  }

  static saveDeviceInfo() {
    SharedUtils.setString("deviceInfo", jsonEncode(deviceInfo?.toJson()));
  }

  static clearAll(Store store) async {
    configInfo = ConfigInfo();
    SharedUtils.remove(SharedConstant.configInfo);
    store.dispatch(UpdateConfigInfo(ConfigInfo()));

    loginInfo = LoginInfo();
    SharedUtils.remove(SharedConstant.loginInfo);
    store.dispatch(UpdateLoginInfo(LoginInfo()));

    userData = UserData();
    SharedUtils.remove(SharedConstant.userData);
    store.dispatch(UpdateUserInfo(UserData()));
  }

  static getConfigInfoLocal() async {
    var _configInfo = await SharedUtils.getString(SharedConstant.configInfo);

    if (_configInfo != null && _configInfo != '') {
      var dataInfo = json.decode(_configInfo);
      ConfigInfo data = ConfigInfo.fromJson(dataInfo);
      return new DataResult(data, true);
    } else {
      return new DataResult(null, false);
    }
  }

  static getLoginInfoLocal() async {
    var _loginInfo = await SharedUtils.getString(SharedConstant.loginInfo);

    if (_loginInfo != null && _loginInfo != '') {
      var dataInfo = json.decode(_loginInfo);
      LoginInfo data = LoginInfo.fromJson(dataInfo);
      return new DataResult(data, true);
    } else {
      return new DataResult(null, false);
    }
  }

  static getCurrentModel() async {
    var _petModel = await SharedUtils.getString(SharedConstant.petModel);

    if (_petModel != null && _petModel != '') {
      var jsonData = json.decode(_petModel);
      PetModel data = PetModel.fromJson(jsonData);
      return new DataResult(data, true);
    } else {
      return new DataResult(null, false);
    }
  }

  static getDeviceInfoLocal() async {
    var _deviceInfo = await SharedUtils.getString(SharedConstant.deviceInfo);

    if (_deviceInfo != null && _deviceInfo != '') {
      var dataInfo = json.decode(_deviceInfo);
      DeviceInfoModel data = DeviceInfoModel.fromJson(dataInfo);
      return new DataResult(data, true);
    } else {
      return new DataResult(null, false);
    }
  }

  static getUserInfoLocal() async {
    var _userData = await SharedUtils.getString(SharedConstant.userData);

    if (_userData != null && _userData != '') {
      var dataInfo = json.decode(_userData);
      UserData data = UserData.fromJson(dataInfo);
      return new DataResult(data, true);
    } else {
      return new DataResult(null, false);
    }
  }

  static saveShowWelcome() {
    SharedUtils.setBool(SharedConstant.welcomePage, true);
  }

  static unSaveLoginStatus() {
    SharedUtils.setBool(SharedConstant.isLogin, false);
  }

  static saveLogin() {
    SharedUtils.setBool(SharedConstant.isLogin, true);
  }

  static Future<DataResult> initUserInfo(Store store) async {
    DataResult config = await getConfigInfoLocal();
    if (config != null && config.result) {
      configInfo = config.data;
      store.dispatch(UpdateConfigInfo(config.data));
    }
    DataResult login = await getLoginInfoLocal();
    if (login != null && login.result) {
      loginInfo = login.data;
      bool isLogin = loginInfo.userId != null &&
          loginInfo.userId > 0 &&
          loginInfo.token != null &&
          loginInfo.token.length > 0;
      store.dispatch(UpdateLoginInfo(login.data));
      store.dispatch(LoginStatusAction(isLogin));
    }

    DataResult userInfo = await getUserInfoLocal();
    if (userInfo != null && userInfo.result) {
      userData = userInfo.data;
      store.dispatch(UpdateUserInfo(userInfo.data));
    }

    DataResult petInfo = await getCurrentModel();
    if (petInfo != null && petInfo.result) {
      petModel = petInfo.data;
      store.dispatch(UpdateCurrentPet(petInfo.data));
    }
    DataResult device = await getDeviceInfoLocal();
    if (device != null && device.result) {
      deviceInfo = device.data;
      store.dispatch(UpdateDeviceInfo(device.data));
    }
    int themeIndex = await SharedUtils.getInt(SharedConstant.themeColorIndex);
    if (themeIndex != null) {
      FunctionUtils.setThemeData(store, themeIndex);
    }
    int localeIndex = await SharedUtils.getInt(SharedConstant.localIndex);
    if (localeIndex != null) {
      FunctionUtils.changeLocale(store, localeIndex);
    } else {
      FunctionUtils.curLocale = store.state.platformLocale;
      store.dispatch(RefreshLocaleAction(store.state.platformLocale));
    }
    return DataResult(userInfo.data, (userInfo.result && login.result));
  }
}

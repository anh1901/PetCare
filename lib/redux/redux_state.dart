import 'package:flutter/material.dart';
import 'package:petcare/models/config_info_model.dart';
import 'package:petcare/models/divice_info_model.dart';
import 'package:petcare/models/login_info_model.dart';
import 'package:petcare/models/user_data_model.dart';
import 'package:petcare/redux/reducer/locale_reducer.dart';
import 'package:petcare/redux/reducer/login_reducer.dart';
import 'package:petcare/redux/reducer/theme_reducer.dart';
import 'package:petcare/redux/reducer/user_reducer.dart';
import 'package:redux/redux.dart';

import 'models/pet_model.dart';

class ReduxState {
  ThemeData themeData;
  bool isNightModal;
  Locale locale;
  Locale platformLocale;
  bool isLogin;
  ConfigInfo configInfo;
  LoginInfo loginInfo;
  UserData userData;
  DeviceInfoModel deviceInfo;
  List<PetModel> petList;
  PetModel currentPet;
  ReduxState({
    this.locale,
    this.themeData,
    this.isNightModal,
    this.isLogin,
    this.loginInfo,
    this.configInfo,
    this.userData,
    this.deviceInfo,
    this.petList,
    this.currentPet,
  });
}

ReduxState appReducer(ReduxState state, action) {
  return ReduxState(
    themeData: ThemeDataReducer(state.themeData, action),
    isNightModal: NightModalReducer(state.isNightModal, action),
    locale: LocaleReducer(state.locale, action),
    isLogin: LoginReducer(state.isLogin, action),
    loginInfo: LoginInfoReducer(state.loginInfo, action),
    configInfo: ConfigInfoReducer(state.configInfo, action),
    userData: UserInfoModelReducer(state.userData, action),
    deviceInfo: DeviceInfoReducer(state.deviceInfo, action),
    petList: PetListReducer(state.petList, action),
    currentPet: CurrentPetReducer(state.currentPet, action),
  );
}

final List<Middleware<ReduxState>> middleware = [
  LoginMiddleware(),
];

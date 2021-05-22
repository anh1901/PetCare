import 'dart:convert';

import 'package:petcare/caches/shared_constant.dart';
import 'package:petcare/caches/shared_util.dart';
import 'package:petcare/models/config_info_model.dart';
import 'package:petcare/models/divice_info_model.dart';
import 'package:petcare/models/login_info_model.dart';
import 'package:petcare/models/user_data_model.dart';
import 'package:petcare/redux/models/pet_model.dart';
import 'package:redux/redux.dart';

final ConfigInfoReducer = combineReducers<ConfigInfo>(
    [TypedReducer<ConfigInfo, UpdateConfigInfo>(_updateConfigLoaded)]);

ConfigInfo _updateConfigLoaded(ConfigInfo configInfo, UpdateConfigInfo action) {
  configInfo = action.configInfo;
  SharedUtils.setString(
      SharedConstant.configInfo, jsonEncode(action.configInfo?.toJson()));
  return configInfo;
}

class UpdateConfigInfo {
  final ConfigInfo configInfo;

  UpdateConfigInfo(this.configInfo);
}

final LoginInfoReducer = combineReducers<LoginInfo>(
    [TypedReducer<LoginInfo, UpdateLoginInfo>(_updateLoginLoaded)]);

LoginInfo _updateLoginLoaded(LoginInfo loginInfo, UpdateLoginInfo action) {
  loginInfo = action.loginInfo;
  SharedUtils.setString(
      SharedConstant.loginInfo, jsonEncode(action.loginInfo?.toJson()));
  return loginInfo;
}

class UpdateLoginInfo {
  final LoginInfo loginInfo;

  UpdateLoginInfo(this.loginInfo);
}

final UserInfoModelReducer = combineReducers<UserData>(
    [TypedReducer<UserData, UpdateUserInfo>(_updateLoaded)]);

UserData _updateLoaded(UserData userInfo, UpdateUserInfo action) {
  userInfo = action.userInfo;
  SharedUtils.setString(
      SharedConstant.userData, jsonEncode(action.userInfo?.toJson()));
  return userInfo;
}

class UpdateUserInfo {
  final UserData userInfo;

  UpdateUserInfo(this.userInfo);
}

final DeviceInfoReducer = combineReducers<DeviceInfoModel>(
    [TypedReducer<DeviceInfoModel, UpdateDeviceInfo>(_updateDeviceLoaded)]);

DeviceInfoModel _updateDeviceLoaded(DeviceInfoModel deviceInfo, action) {
  deviceInfo = action.deviceInfo;
  return deviceInfo;
}

class UpdateDeviceInfo {
  final DeviceInfoModel deviceInfo;

  UpdateDeviceInfo(this.deviceInfo);
}

final PetListReducer = combineReducers<List<PetModel>>(
    [TypedReducer<List<PetModel>, UpdatePetList>(_updatePetList)]);

List<PetModel> _updatePetList(List<PetModel> models, UpdatePetList action) {
  models = action.petList;
  return models;
}

class UpdatePetList {
  final List<PetModel> petList;

  UpdatePetList(this.petList);
}

final CurrentPetReducer = combineReducers<PetModel>(
    [TypedReducer<PetModel, UpdateCurrentPet>(_updateCurrentPet)]);

PetModel _updateCurrentPet(PetModel model, UpdateCurrentPet action) {
  model = action.model;
  SharedUtils.setString(
      SharedConstant.petModel, jsonEncode(action.model.toJson()));
  return model;
}

class UpdateCurrentPet {
  final PetModel model;

  UpdateCurrentPet(this.model);
}

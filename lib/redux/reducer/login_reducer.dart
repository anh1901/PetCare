import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:petcare/caches/shared_constant.dart';
import 'package:petcare/caches/shared_storage.dart';
import 'package:petcare/caches/shared_util.dart';
import 'package:petcare/models/login_info_model.dart';
import 'package:petcare/redux/redux_index.dart';
import 'package:petcare/utils/route_util.dart';
import 'package:petcare/widgets/toast.dart';
import 'package:redux/redux.dart';

class LoginStatusAction {
  final bool status;
  LoginStatusAction(this.status);
}

class LogoutAction {
  final BuildContext context;
  LogoutAction(this.context);
}

bool _loginResult(bool result, LoginStatusAction action) {
  SharedUtils.setBool(SharedConstant.isLogin, action.status);
  return action.status;
}

bool _logoutResult(bool result, LogoutAction action) {
  return true;
}

final LoginReducer = combineReducers<bool>([
  TypedReducer<bool, LoginStatusAction>(_loginResult),
  TypedReducer<bool, LogoutAction>(_logoutResult),
]);

final LoginSuccessReducer = combineReducers<bool>([
  TypedReducer<bool, LoginStatusAction>(_loginSuccessResult),
]);

bool _loginSuccessResult(bool result, LoginStatusAction action) {
  SharedUtils.setBool(SharedConstant.isLogin, action.status);
  return action.status;
}

class LoginSuccessAction {
  final BuildContext context;
  final LoginInfo loginInfo;

  LoginSuccessAction(this.context, this.loginInfo);
}

class LoginMiddleware implements MiddlewareClass<ReduxState> {
  @override
  void call(Store<ReduxState> store, dynamic action, NextDispatcher next) {
    if (action is LogoutAction) {
      SharedUtils.setBool(SharedConstant.isLogin, false);
      SharedStorage.clearAll(store);
    }
    if (action is LoginSuccessAction) {
      store.dispatch(LoginStatusAction(true));

      LoginInfo loginInfo = action.loginInfo;
      SharedStorage.loginInfo = loginInfo;
      SharedUtils.setString(
        SharedConstant.loginInfo,
        jsonEncode(
          loginInfo?.toJson(),
        ),
      );
      SharedUtils.setBool(SharedConstant.isLogin, true);
      // FetchUserInfoAction.loadPetList(store);
      // FetchUserInfoAction.loadUserData(store).then((value) {});

      /*PointRequest.eventBaseRequest('APP首页', loginInfo.token, loginInfo.userId)
          .then((value) {});
*/
      RouteUtil.popToRoutePage(action.context);
      Toast.showSuccess('Login Success');
    }
    next(action);
  }
}

import 'package:petcare/caches/shared_storage.dart';
import 'package:petcare/config/http_refresh/http_config.dart';
import 'package:petcare/config/http_refresh/http_request.dart';
import 'package:petcare/models/login_info_model.dart';
import 'package:petcare/models/user_data_model.dart';
import 'package:petcare/redux/models/pet_model.dart';
import 'package:redux/redux.dart';

import '../reducer/reducer_index.dart';

class FetchUserInfoAction {
  static Future loadUserData(Store store) async {
    LoginInfo loginInfo = SharedStorage.loginInfo;
    final url = HttpConfig.userIndex;
    final httpURL = url + '?userId=${loginInfo.userId}';

    ResponseData response = await RequestUrl.getRequest(httpURL);
    UserData userInfo = UserData();
    if (response.isSuccess) {
      if (response.data != null) {
        userInfo = UserData.fromJson(response.data);
        SharedStorage.userData = userInfo;
      }
      store.dispatch(UpdateUserInfo(userInfo));
    }
  }

  static void loadPetList(Store store) async {
    LoginInfo loginInfo = SharedStorage.loginInfo;
    final url = '${HttpConfig.baseURL}?userId=${loginInfo.userId}';

    ResponseData response = await RequestUrl.getRequest(url);

    List<PetModel> modelList = [];
    if (response.isSuccess) {
      if (response.data != null) {
        List<dynamic> jsonArr = response.data ?? [];
        modelList = jsonArr.map((e) => PetModel.fromJson(e)).toList();
      }
      store.dispatch(UpdatePetList(modelList));
      PetModel currentPet = store.state.currentPet;
      if (modelList.length > 0 &&
          (currentPet == null || currentPet.petName == null)) {
        store.dispatch(UpdateCurrentPet(modelList.first));
      }
    }
  }
}

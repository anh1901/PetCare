import 'package:petcare/config/http_refresh/view_list_refresh.dart';
import 'package:petcare/models/post_model.dart';

import 'home_page_request.dart';

class PostsProvider extends ViewListRefresh {
  List<PostModel> _postArray = [];

  List<PostModel> get postArray => _postArray;

  void setPostArray(List<dynamic> value) {
    _postArray = value.map((e) {
      PostModel model = e;
      return model;
    }).toList();
    print(_postArray);
  }

  @override
  Future<List<PostModel>> loadData({int pageIndex}) async {
    var result = await FindRequest.requestPostList(pageIndex);
    return result;
  }

  void reloadList(PostModel model) {
    List<dynamic> newModels =
        list.where((element) => element.userId != model.userId).toList();
    list = newModels;
    notifyListeners();
  }
}

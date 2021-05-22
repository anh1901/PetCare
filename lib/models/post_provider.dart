import 'package:petcare/models/post_model.dart';

class PostProvider {
  List<PostModel> _postList = [];
  List<PostModel> get postList => _postList;
  void setPostList(List<dynamic> value) {
    _postList = value.map((e) {
      PostModel model = e;
      return model;
    });
  }
}

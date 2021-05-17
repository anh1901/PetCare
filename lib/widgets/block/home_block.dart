import 'package:rxdart/rxdart.dart';

import 'block.dart';

class HomeBlock implements Block {
  final _homeStateController = PublishSubject<List>();
  @override
  void init() {
    // TODO: implement init
  }
  @override
  void dispose() {
    _homeStateController.close();
  }
}

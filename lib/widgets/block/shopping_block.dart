import 'package:rxdart/rxdart.dart';

import 'block.dart';

class ShoppingBlock implements Block {
  final _shoppingStateController = PublishSubject<List>();
  @override
  void init() {
    // TODO: implement init
  }
  @override
  void dispose() {
    _shoppingStateController.close();
  }
}

import 'package:rxdart/rxdart.dart';

import 'block.dart';

class PetsBlock implements Block {
  final _petsStateController = PublishSubject<List>();
  @override
  void init() {
    // TODO: implement init
  }
  @override
  void dispose() {
    _petsStateController.close();
  }
}

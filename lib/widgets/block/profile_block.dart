import 'package:rxdart/rxdart.dart';

import 'block.dart';

class ProfileBlock implements Block {
  final _profileStateController = PublishSubject<List>();
  @override
  void init() {
    // TODO: implement init
  }
  @override
  void dispose() {
    _profileStateController.close();
  }
}

import 'package:redux/redux.dart';

final WelcomeReducer = combineReducers<bool>([
  TypedReducer<bool, RefreshShowWelcomeAction>(_refreshWelcome),
]);
bool _refreshWelcome(bool showWelcome, action) {
  showWelcome = action.showWelcome;
  return showWelcome;
}

class RefreshShowWelcomeAction {
  final bool showWelcome;

  RefreshShowWelcomeAction(this.showWelcome);
}

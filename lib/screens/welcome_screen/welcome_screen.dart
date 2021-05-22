import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:petcare/caches/shared_storage.dart';
import 'package:petcare/redux/redux_state.dart';
import 'package:petcare/utils/function_util.dart';
import 'package:petcare/utils/route_util.dart';
import 'package:petcare/widgets/image_path.dart';

class WelcomeScreen extends StatefulWidget {
  static final String routerName = 'welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  PageController _pageController = PageController();

  bool hadInit = false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (hadInit) return;
    hadInit = true;
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<ReduxState>(
      builder: (context, store) {
        return Material(
          child: PageView(
            controller: _pageController,
            children: [1, 2, 3, 4].map(
              (index) {
                return GestureDetector(
                  child: Image.asset(
                    ImagePath.asset('intro$index'),
                    fit: BoxFit.cover,
                  ),
                  onTap: () {
                    if (index == 4) {
                      SharedStorage.saveShowWelcome();
                      SharedStorage.initUserInfo(store).then(
                        (result) {
                          if (FunctionUtils.isLogin()) {
                            //
                          }
                          RouteUtil.pushMainRoot(context);
                        },
                      );
                    }
                  },
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}

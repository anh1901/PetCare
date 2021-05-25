import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:petcare/caches/shared_storage.dart';
import 'package:petcare/redux/redux_state.dart';
import 'package:petcare/screens/basic_screen/basic_screen.dart';

//fake users
const users = const {
  'anhwtuan': '12345678',
  'asdfghjkl': 'qwertyuiop',
};

class LoginScreen extends StatelessWidget {
  static const routerName = '/login';
  Duration get loginTime => Duration(milliseconds: 2250);
  Future<String> _authUser(LoginData data) {
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'Username not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      //for tesing
      return null;
    });
  }

  Future<String> _recoverPassword(String username) {
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(username)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<ReduxState>(
      builder: (context, store) {
        return FlutterLogin(
          title: 'Pet Care',
          logo: 'assets/images/heart_paw.png',
          onLogin: _authUser,
          onSignup: _authUser,
          loginProviders: <LoginProvider>[
            LoginProvider(
              icon: FontAwesomeIcons.google,
              callback: () async {
                await Future.delayed(loginTime);
                return;
              },
            ),
            LoginProvider(
              icon: FontAwesomeIcons.facebookF,
              callback: () async {
                await Future.delayed(loginTime);
                return;
              },
            ),
            LoginProvider(
              icon: FontAwesomeIcons.linkedinIn,
              callback: () async {
                await Future.delayed(loginTime);
                return;
              },
            ),
            LoginProvider(
              icon: FontAwesomeIcons.githubAlt,
              callback: () async {
                await Future.delayed(loginTime);
                return;
              },
            ),
          ],
          //onSignup: _authUser,
          onSubmitAnimationCompleted: () {
            SharedStorage.saveLogin();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => BasicScreen(),
            ));
          },
          onRecoverPassword: _recoverPassword,
        );
      },
    );
  }
}

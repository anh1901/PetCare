import 'package:flutter/material.dart';
import 'package:petcare/screens/splash_screen/splash_screen.dart';
import 'package:petcare/services/authentication_service.dart';
import 'package:petcare/widgets/app_size.dart';
import 'package:provider/provider.dart';

//fake users

class LoginScreen extends StatelessWidget {
  static const routerName = '/login';
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 120.0,
                  child: Image.asset(
                    "assets/images/pet_health.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                TextField(
                  controller: usernameController,
                  obscureText: false,
                  style: style,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Username or email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
                SizedBox(height: 25.0),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  style: style,
                  decoration: InputDecoration(
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32.0))),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(30.0),
                  color: Color(0xff01A0C7),
                  child: MaterialButton(
                    minWidth: SizeFit.screenWidth,
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      context.read<AuthenticationService>().signIn(
                            email: usernameController.text.trim(),
                            password: passwordController.text.trim(),
                          );
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (BuildContext context) => SplashScreen(),
                        ),
                      );
                    },
                    child: Text("Login",
                        textAlign: TextAlign.center,
                        style: style.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// import 'package:flushbar/flushbar.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:petcare/models/user.dart';
// import 'package:petcare/screens/basic_screen/basic_screen.dart';
// import 'package:petcare/screens/login_screen/components/auth.dart';
// import 'package:petcare/services/validator.dart';
//
// import 'components/loading.dart';
//
// class LoginScreen extends StatefulWidget {
//   static final String routerName = 'login';
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _email = new TextEditingController();
//   final TextEditingController _password = new TextEditingController();
//
//   bool _autoValidate = false;
//   bool _loadingVisible = false;
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   Widget build(BuildContext context) {
//     final logo = Hero(
//       tag: 'hero',
//       child: CircleAvatar(
//           backgroundColor: Colors.transparent,
//           radius: 60.0,
//           child: ClipOval(
//             child: Image.asset(
//               'assets/images/pet_health.png',
//               fit: BoxFit.cover,
//               width: 120.0,
//               height: 120.0,
//             ),
//           )),
//     );
//
//     final email = TextFormField(
//       keyboardType: TextInputType.emailAddress,
//       autofocus: false,
//       controller: _email,
//       validator: Validator.validateEmail,
//       decoration: InputDecoration(
//         prefixIcon: Padding(
//           padding: EdgeInsets.only(left: 5.0),
//           child: Icon(
//             Icons.email,
//             color: Colors.grey,
//           ), // icon is 48px widget.
//         ), // icon is 48px widget.
//         hintText: 'Email',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//       ),
//     );
//
//     final password = TextFormField(
//       autofocus: false,
//       obscureText: true,
//       controller: _password,
//       validator: Validator.validatePassword,
//       decoration: InputDecoration(
//         prefixIcon: Padding(
//           padding: EdgeInsets.only(left: 5.0),
//           child: Icon(
//             Icons.lock,
//             color: Colors.grey,
//           ), // icon is 48px widget.
//         ), // icon is 48px widget.
//         hintText: 'Password',
//         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
//       ),
//     );
//
//     final loginButton = Padding(
//       padding: EdgeInsets.symmetric(vertical: 16.0),
//       child: RaisedButton(
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(24),
//         ),
//         onPressed: () {
//           _emailLogin(
//               email: _email.text, password: _password.text, context: context);
//         },
//         padding: EdgeInsets.all(12),
//         color: Theme.of(context).primaryColor,
//         child: Text('SIGN IN', style: TextStyle(color: Colors.white)),
//       ),
//     );
//
//     final forgotLabel = FlatButton(
//       child: Text(
//         'Forgot password?',
//         style: TextStyle(color: Colors.black54),
//       ),
//       onPressed: () {
//         Navigator.pushNamed(context, '/forgot-password');
//       },
//     );
//
//     final signUpLabel = FlatButton(
//       child: Text(
//         'Create an Account',
//         style: TextStyle(color: Colors.black54),
//       ),
//       onPressed: () {
//         Navigator.pushNamed(context, '/signup');
//       },
//     );
//     final skipLabel = FlatButton(
//       child: Text(
//         'Skip',
//         style: TextStyle(color: Colors.grey),
//       ),
//       onPressed: () {
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (BuildContext context) => BasicScreen(),
//           ),
//         );
//       },
//     );
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: LoadingScreen(
//           child: Form(
//             key: _formKey,
//             autovalidate: _autoValidate,
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Center(
//                 child: SingleChildScrollView(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.stretch,
//                     children: <Widget>[
//                       logo,
//                       SizedBox(height: 48.0),
//                       email,
//                       SizedBox(height: 24.0),
//                       password,
//                       SizedBox(height: 12.0),
//                       loginButton,
//                       forgotLabel,
//                       signUpLabel,
//                       skipLabel,
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           inAsyncCall: _loadingVisible),
//     );
//   }
//
//   Future<void> _changeLoadingVisible() async {
//     setState(() {
//       _loadingVisible = !_loadingVisible;
//     });
//   }
//
//   void _emailLogin(
//       {String email, String password, BuildContext context}) async {
//     if (_formKey.currentState.validate()) {
//       try {
//         SystemChannels.textInput.invokeMethod('TextInput.hide');
//         await _changeLoadingVisible();
//         await logInUser(email, password);
//         await Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (BuildContext context) => BasicScreen(),
//           ),
//         );
//       } catch (e) {
//         _changeLoadingVisible();
//         print("Sign In Error: $e");
//         String exception = Auth.getExceptionText(e);
//         Flushbar(
//           title: "Sign In Error",
//           message: exception,
//           duration: Duration(seconds: 5),
//         ).show(context);
//       }
//     } else {
//       setState(() => _autoValidate = true);
//     }
//   }
//
//   Future<void> logOutUser() async {
//     await Auth.signOut();
//   }
//
//   Future<void> logInUser(email, password) async {
//     String userId = await Auth.signIn(email, password);
//     UserModel user = (await Auth.getUserFirestore(userId));
//     await Auth.storeUserLocal(user);
//   }
// }

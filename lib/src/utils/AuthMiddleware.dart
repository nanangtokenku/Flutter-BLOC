import 'package:flutter/material.dart';
import '../ui/login/LoginScreen.dart';
import 'AppPreferences.dart';
//import 'package:aztira/src/ui/login/LoginScreen.dart'
//import 'package:my_app/services/auth_service.dart';

class AuthMiddleware extends StatelessWidget {
  final Widget child;

  const AuthMiddleware({Key key, this.child}) : super(key: key);
  //final AuthService authService;

  //AuthMiddleware({required this.child, required this.authService});

  @override
  Widget build(BuildContext context) {
    // authService.isAuthenticated().then((isAuthenticated) {
    String name = AppPreferences.getString('token', defaultValue: 'v13nr2');
    if (name == "") {
      //Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => LoginPage());
      //);
    }
    // });

    return child;
  }
}

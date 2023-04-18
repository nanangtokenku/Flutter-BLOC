import 'package:aztira/src/resources/loginApiProvider.dart';
import 'package:flutter/material.dart';

//import 'package:aztira/src/ui/login/LoginScreen.dart'
//import 'package:my_app/services/auth_service.dart';

class AuthMiddleware extends StatelessWidget {
  final Widget child;

  final LoginApiProvider authService;

  AuthMiddleware({this.child, this.authService});

  String get email => "fe@fe.com";

  String get password => "12345678";

  @override
  Widget build(BuildContext context) {
    //authService.fetchUserList(email, password).then((isAuthenticated) {
    //String name = AppPreferences.getString('token', defaultValue: 'v13nr2');
    //if (name == "") {
    // Navigator.of(context)
    //  .push(MaterialPageRoute(builder: (context) => LoginPage()));
    //}
    //});

    return child;
  }
}

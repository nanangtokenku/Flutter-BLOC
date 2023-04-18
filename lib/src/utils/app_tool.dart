import 'dart:js';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ui/login/LoginScreen.dart';
import 'AppPreferences.dart';
import 'keys.dart';

showSnackbar(GlobalKey<ScaffoldState> scaffoldState, String message,
    {MaterialColor materialColor}) {
  if (message.isEmpty) return;
  // Find the Scaffold in the Widget tree and use it to show a SnackBar
  // scaffoldState.currentState.showSnackBar(
  //     SnackBar(content: Text(message), backgroundColor: materialColor));
}

launchURL(String url) async {
  if (url.isEmpty) return;
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    await launchUrl(url as Uri);
  } else {
    throw 'Could not launch $url';
  }
}

handleLoginSession(BuildContext context) async {
  Future.delayed(Duration(seconds: 2), () {
    String adaToken =
        AppPreferences.getString('token', defaultValue: 'John Doe');
    if (adaToken != "") {
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  });
}

class MessageInCenterWidget extends StatelessWidget {
  final String _message;

  MessageInCenterWidget(this._message);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(_message,
          key: ValueKey(HomePageKeys.MESSAGE_IN_CENTER),
          style: TextStyle(fontSize: FONT_MEDIUM, color: Colors.black)),
    );
  }
}

import 'dart:ui';

import 'package:ecommerce/shared/controllers/logincontroller.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    @override
    initState() async {
      LoginController _loginController = LoginController();

      var prefs = await SharedPreferences.getInstance();
      var token = prefs.getString('token');
      var email = prefs.getString('email');

      try {
        await _loginController.signInWithToken(context, token, email);
      } catch (e) {
        Navigator.pushReplacementNamed(context, "/login");
      }
    }

    initState();

    return const SizedBox(
        child: Center(
            child: CircularProgressIndicator(
      color: Colors.red,
      backgroundColor: Colors.black,
    )));
  }
}

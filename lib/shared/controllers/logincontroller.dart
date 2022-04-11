import 'dart:convert';
import 'package:ecommerce/shared/controllers/auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  String token = "";

  Future signInWithEmailandPassword(
      context, String email, String password) async {
    var _url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDHL3vfB_kk4H19Dw5ndbROdWF759-qITA');
    var response = await http.post(_url,
        body: json.encode(
            {"email": email, "password": password, "returnSecureToken": true}));
    if (response.statusCode == 200) {
      Auth _auth = Auth();
      await _auth.getUserData(context, email.toString());
      Navigator.pushReplacementNamed(context, "/home");
      token = json.decode(response.body)['refreshToken'];
    }
  }

  Future signInWithToken(context, token, email) async {
    var _url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithCustomToken?key=AIzaSyDHL3vfB_kk4H19Dw5ndbROdWF759-qITA');
    var response = await http.post(_url,
        body: json.encode({"token": token, "returnSecureToken": true}));

    Auth _auth = Auth();
    await _auth.getUserData(context, email.toString());
    Navigator.pushReplacementNamed(context, "/home");
    token = json.decode(response.body)['refreshToken'];
  }
}

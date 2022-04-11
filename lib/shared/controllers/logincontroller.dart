import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginController {
  Future<void> signIn(String email, String password) async {
    var _url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDHL3vfB_kk4H19Dw5ndbROdWF759-qITA');
    var response = await http.post(_url,
        headers: {"key": "AIzaSyDHL3vfB_kk4H19Dw5ndbROdWF759-qITA"},
        body: json.encode(
            {"email": email, "password": password, "returnSecureToken": true}));
  }
}

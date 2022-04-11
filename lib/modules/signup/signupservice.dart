import 'dart:convert';
import 'package:ecommerce/shared/controllers/firebasecontroller.dart';
import 'package:http/http.dart' as http;

class SignUpService {
  Future<void> signUp(String email, String name, String password) async {
    var _url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyDHL3vfB_kk4H19Dw5ndbROdWF759-qITA');
    await http.post(_url,
        headers: {"key": "AIzaSyDHL3vfB_kk4H19Dw5ndbROdWF759-qITA"},
        body: json.encode(
            {"email": email, "password": password, "returnSecureToken": true}));

    FirebaseController firebase = FirebaseController();
    await firebase.setUser(email: email, name: name);
  }
}

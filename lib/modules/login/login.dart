import 'package:ecommerce/shared/controllers/logincontroller.dart';
import 'package:ecommerce/shared/objects/searchbox.dart';
import 'package:ecommerce/shared/theme/appcolors.dart';
import 'package:ecommerce/shared/theme/appimages.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

TextEditingController loginTextController = TextEditingController();
TextEditingController passwordTextController = TextEditingController();

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Image.asset(AppImages.titleImage),
            CustomTextField(
              hint: "E-mail",
              obscure: false,
              controller: loginTextController,
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              hint: "Senha",
              obscure: true,
              controller: passwordTextController,
            ),
            Container(
              margin: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              child: TextButton(
                  onPressed: () async {
                    LoginController loginController = LoginController();
                    await loginController.signInWithEmailandPassword(context,
                        loginTextController.text, passwordTextController.text);
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setString("token", loginController.token);
                    await prefs.setString("email", loginTextController.text);
                    loginTextController.clear();
                    passwordTextController.clear();
                  },
                  child: const Text(
                    "ENTRAR",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  )),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/signup");
                },
                child: const Text(
                  "Cadastre-se",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}

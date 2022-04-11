import 'package:ecommerce/modules/signup/signupservice.dart';
import 'package:ecommerce/shared/objects/searchbox.dart';
import 'package:ecommerce/shared/theme/appcolors.dart';
import 'package:flutter/material.dart';

TextEditingController signUpNameController = TextEditingController();
TextEditingController signUpEmailController = TextEditingController();
TextEditingController signUpPasswordController = TextEditingController();
TextEditingController signUpRepeatPasswordController = TextEditingController();

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          title: const Text("NOVO USUÁRIO"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              CustomTextField(
                  hint: "Seu nome",
                  obscure: false,
                  controller: signUpNameController),
              CustomTextField(
                  hint: "E-mail",
                  obscure: false,
                  controller: signUpEmailController),
              CustomTextField(
                  hint: "Senha",
                  obscure: true,
                  controller: signUpPasswordController),
              CustomTextField(
                  hint: "Repita a senha",
                  obscure: true,
                  controller: signUpRepeatPasswordController),
              const Divider(),
              Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                    color: Colors.purple,
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: TextButton(
                    // ignore: unrelated_type_equality_checks
                    onPressed: signUpPasswordController.text !=
                            signUpRepeatPasswordController
                        ? () async {
                            SignUpService _signUpService = SignUpService();
                            await _signUpService.signUp(
                              signUpEmailController.text,
                              signUpNameController.text,
                              signUpPasswordController.text,
                            );
                            signUpEmailController.clear();
                            signUpNameController.clear();
                            signUpPasswordController.clear();
                            signUpRepeatPasswordController.clear();
                            Navigator.pop(context);
                          }
                        : null,
                    child: const Text(
                      "CADASTRAR",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    )),
              )
            ],
          ),
        ));
  }
}

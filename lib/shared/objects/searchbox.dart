import 'package:ecommerce/shared/theme/appcolors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  CustomTextField(
      {Key? key,
      required this.hint,
      required this.obscure,
      required this.controller})
      : super(key: key);
  String hint;
  bool obscure;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        controller: controller,
        textAlign: TextAlign.center,
        obscureText: obscure,
        textAlignVertical: TextAlignVertical.bottom,
        maxLines: 1,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: hint,
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary),
                borderRadius: BorderRadius.all(Radius.circular(12))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary),
                borderRadius: BorderRadius.all(Radius.circular(12)))),
      ),
    );
  }
}

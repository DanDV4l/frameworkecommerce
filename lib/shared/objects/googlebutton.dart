import 'package:ecommerce/shared/theme/appimages.dart';
import 'package:flutter/material.dart';

Widget buildLoginButton({onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.all(12),
      height: 56,
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey.shade200.withOpacity(1),
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        children: [
          Container(
            height: 56,
            decoration: const BoxDecoration(
              border: Border(right: BorderSide(color: Colors.black)),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 2, right: 2),
              child: Image.asset(AppImages.google),
            ),
          ),
          const Expanded(
            flex: 4,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'Entre com o Google',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

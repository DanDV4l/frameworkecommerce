import 'package:ecommerce/shared/providers/generalprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget buildDrawer(context) {
  return Container(
    margin: const EdgeInsets.all(80),
    padding: const EdgeInsets.all(25),
    color: Colors.white,
    height: MediaQuery.of(context).size.height * 0.25,
    //width: 300,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Olá,",
          style: TextStyle(fontSize: 18),
        ),
        Text(
          Provider.of<GeneralProvider>(context, listen: false).user!.name!,
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ),
        const Divider(
          color: Colors.black,
        ),
        ListTile(
          leading: const Icon(
            Icons.exit_to_app,
            color: Colors.red,
            size: 20,
          ),
          title: const Text(
            "SAIR",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          onTap: () async {
            var prefs = await SharedPreferences.getInstance();
            prefs.clear();

            Navigator.pushReplacementNamed(context, "/login");
          },
        )
      ],
    ),
  );
}

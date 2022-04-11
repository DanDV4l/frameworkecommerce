// ignore_for_file: file_names, use_key_in_widget_constructors, prefer_typing_uninitialized_variables

import 'package:ecommerce/shared/providers/generalprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeIconItem extends StatelessWidget {
  final String label;
  final String imageURL;
  final select;

  const HomeIconItem(
      {Key? key,
      required this.label,
      required this.imageURL,
      required this.select});
  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Provider.of<GeneralProvider>(context, listen: false).selected = select;
        Navigator.pushNamed(context, "/product");
      },
      child: SizedBox(
        width: _screenSize.width * 0.2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              child: Image.network(
                imageURL,
                fit: BoxFit.fill,
                width: 80,
                height: 80,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            Container(
              margin: const EdgeInsets.only(top: 5, bottom: 5),
              color: Colors.black,
              width: 25,
              height: 1,
            ),
            Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce/shared/providers/generalprovider.dart';
import 'package:ecommerce/shared/theme/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final selected;
  const ProductPage({Key? key, required this.selected}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selected.name.toUpperCase()),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(selected.imgURL),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const Divider(
                    color: Colors.black,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<GeneralProvider>(context, listen: false)
                          .cart
                          .add(selected);
                      Provider.of<GeneralProvider>(context, listen: false)
                          .addToTotal(selected.price);
                    },
                    child: Text(
                      "ADICIONAR AO CARRINHO POR R\$${selected.price}",
                      style: const TextStyle(fontSize: 17),
                    ),
                    style: ElevatedButton.styleFrom(primary: Colors.green),
                  ),
                  Text(
                    "Palavras chave:\n ${selected.tags.toString().replaceFirst('[', '').replaceFirst(']', '')}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.grey),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:ecommerce/shared/providers/generalprovider.dart';
import 'package:ecommerce/shared/theme/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //List cart = Provider.of<GeneralProvider>(context, listen: false).cart;
    return Consumer(
        builder: (BuildContext context, GeneralProvider value, Widget? child) {
      return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.done_outlined,
            color: Colors.white,
          ),
          backgroundColor: Colors.green,
          onPressed: () {},
        ),
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<GeneralProvider>(context, listen: false)
                      .clearCart();
                },
                icon: const Icon(
                  Icons.cleaning_services,
                  color: Colors.white,
                ))
          ],
          title: const Text(
            "Carrinho de compras",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: buildBody(context),
      );
    });
  }
}

Widget buildBody(context) {
  return Column(
    children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.7,
        child: ListView.builder(
            itemCount: Provider.of<GeneralProvider>(context, listen: false)
                .cart
                .length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: Image.network(
                  Provider.of<GeneralProvider>(context, listen: false)
                      .cart[index]
                      .imgURL,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  "${Provider.of<GeneralProvider>(context, listen: false).cart[index].name.toUpperCase()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.delete_forever_outlined,
                    color: AppColors.primary,
                  ),
                  onPressed: () {
                    Provider.of<GeneralProvider>(context, listen: false)
                        .reduceToTotal(
                            Provider.of<GeneralProvider>(context, listen: false)
                                .cart[index]
                                .price);

                    Provider.of<GeneralProvider>(context, listen: false)
                        .removeItemFromCart(index);
                  },
                ),
              );
            }),
      ),
      Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.173,
        color: AppColors.primary,
        child: Center(
            child: Text(
          "Total a pagar:\n R\$${Provider.of<GeneralProvider>(context, listen: false).total.toStringAsFixed(2)}",
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        )),
      ),
    ],
  );
}

import 'package:ecommerce/modules/home/home.dart';
import 'package:ecommerce/modules/login/login.dart';
import 'package:ecommerce/modules/product/product.dart';
import 'package:ecommerce/modules/shoppingcart/shoppingcartpage.dart';
import 'package:ecommerce/modules/signup/signup.dart';
import 'package:ecommerce/shared/controllers/firebasecontroller.dart';
import 'package:ecommerce/shared/providers/generalprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseController firebase = FirebaseController();
    firebase.getProducts();
    return MultiProvider(
        providers: [ChangeNotifierProvider(create: (_) => GeneralProvider())],
        child: MaterialApp(
          title: "eCommerce - Framework",
          routes: {
            "/login": (context) => const LoginPage(),
            "/signup": (context) => const SignUpPage(),
            "/home": (context) => const HomePage(),
            "/product": (context) => ProductPage(
                selected: Provider.of<GeneralProvider>(context, listen: false)
                    .selected),
            "/cart": (context) => const ShoppingCartPage()
          },
          initialRoute: "/login",
        ));
  }
}

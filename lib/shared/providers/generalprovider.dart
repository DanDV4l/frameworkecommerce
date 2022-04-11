import 'package:ecommerce/shared/models/productmodel.dart';
import 'package:ecommerce/shared/models/usermodel.dart';
import 'package:flutter/cupertino.dart';

class GeneralProvider extends ChangeNotifier {
  Product? selected;
  User? user;
  List cart = [];

  void clearCart() {
    cart.clear();
    notifyListeners();
  }

  void removeItemFromCart(index) {
    cart.removeAt(index);
    notifyListeners();
  }
}

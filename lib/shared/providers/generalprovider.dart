import 'package:ecommerce/shared/models/productmodel.dart';
import 'package:ecommerce/shared/models/usermodel.dart';
import 'package:flutter/cupertino.dart';

class GeneralProvider extends ChangeNotifier {
  Product? selected;
  User? user;
  List cart = [];
  double total = 0;

  void clearCart() {
    cart.clear();
    total = 0;
    notifyListeners();
  }

  addToTotal(double value) {
    total = total + value;
    notifyListeners();
  }

  reduceToTotal(double value) {
    total > 0 ? total = total - value : total = 0;
    notifyListeners();
  }

  void removeItemFromCart(index) {
    cart.removeAt(index);
    notifyListeners();
  }
}

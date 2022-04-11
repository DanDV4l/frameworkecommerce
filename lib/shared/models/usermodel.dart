import 'package:ecommerce/shared/models/productmodel.dart';

class User {
  String? name;
  String? email;
  List<Product>? purchases = [];

  User(this.name, this.email, this.purchases);
}

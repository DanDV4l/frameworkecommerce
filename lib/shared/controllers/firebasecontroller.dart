import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/shared/models/productmodel.dart';

class FirebaseController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Product>> getProducts() async {
    List<Product> _productList = [];

    await _firestore.collection('products').doc('fruits').get().then((value) {
      value.data()!['fruits'].forEach((element) {
        Product product = Product(element['name'], element['imgURL'],
            element['price'], element['tags']);

        _productList.add(product);
      });
    });

    return _productList;
  }

  Future<void> setUser({required String email, required String name}) async {
    await _firestore
        .collection('users')
        .doc(email)
        .set({"name": name, "email": email, "purchases": []});
  }
}

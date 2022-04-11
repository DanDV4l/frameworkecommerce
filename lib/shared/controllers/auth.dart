import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/shared/models/usermodel.dart';
import 'package:ecommerce/shared/providers/generalprovider.dart';
import 'package:provider/provider.dart';

class Auth {
  Future getUserData(context, email) async {
    FirebaseFirestore _firestore = FirebaseFirestore.instance;

    await _firestore.collection('users').doc(email).get().then((value) {
      User _data = User(value.data()!['name'], value.data()!['email'], []);
      Provider.of<GeneralProvider>(context, listen: false).user = _data;
    });
  }
}

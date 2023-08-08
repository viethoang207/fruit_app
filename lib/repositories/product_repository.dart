import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

import '../models/product/product.dart';

@singleton
class ProductRepository {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List<Product>> getListProduct({required String category}) async {
    List<Product> products = [];
    await db.collection('Product').where("category", isEqualTo: category).get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          products.add(Product.fromJson(docSnapshot.data()));
        }
      },
      onError: (e) => throw e,
    );
    print('Fetched ${products.length} items');
    return products;
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/products.dart';

class ProductServices {
  String collection = "products";
  Firestore _firestore = Firestore.instance;

  Future<List<ProductModel>> getProducts() async =>
      _firestore.collection(collection).getDocuments().then((result) {
        List<ProductModel> products = [];
        for(DocumentSnapshot product in result.documents){
          products.add(ProductModel.fromSnapshopt(product));
        }
        return products;
      });

  Future<List<ProductModel>> getProductsByRestaurant({String id}) async =>
      _firestore.
      collection(collection)
      .where("restaurantId", isEqualTo: id)
      .getDocuments()
      .then((result) {
        List<ProductModel> products = [];
        for(DocumentSnapshot product in result.documents){
          products.add(ProductModel.fromSnapshopt(product));
        }
        return products;
      });


  Future<List<ProductModel>> getProductsOfCategory({String category}) async =>
      _firestore.collection(collection).where("category", isEqualTo: category).getDocuments().then((result) {
        List<ProductModel> products = [];
        for(DocumentSnapshot product in result.documents){
          products.add(ProductModel.fromSnapshopt(product));
        }
        return products;
      });
      Future<List<ProductModel>> searchProducts({String productName}) {
    // code to convert the first character to uppercase
    String searchKey = productName[0].toUpperCase() + productName.substring(1);
    return _firestore
        .collection(collection)
        .orderBy("name")
        .startAt([searchKey])
        .endAt([searchKey + '\uf8ff'])
        .getDocuments()
        .then((result) {
          List<ProductModel> products = [];
          for (DocumentSnapshot product in result.documents) {
            products.add(ProductModel.fromSnapshopt(product));
          }
          return products;
        });
  }
}
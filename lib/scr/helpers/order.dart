import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_course/scr/models/order.dart';
import 'package:food_course/scr/models/user.dart';

class OrderServices {
  String collection = "orders";
  Firestore _firestore = Firestore.instance;

  void createOrder({String userId, String id,String description,String status, List cart, int totalPrice}) {
   
    _firestore.collection(collection).document(id).setData({
"userId": userId,
"id":id,
"cart": cart,
"totalPrice":totalPrice,
"createdAt": DateTime.now().microsecondsSinceEpoch,
"description": description,
"status":status


    });
  }

    Future<List<OrderModel>> getUserOrders({String userId}) async =>
      _firestore.
      collection(collection)
      .where("userId", isEqualTo: userId)
      .getDocuments()
      .then((result) {
        List<OrderModel> orders = [];
        for(DocumentSnapshot order in result.documents){
          orders.add(OrderModel.fromSnapshopt(order));
        }
        return orders;
      });
}

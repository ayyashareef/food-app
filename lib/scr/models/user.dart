import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_course/scr/models/cart_item.dart';

class UserModel {
  static const NAME = "name";
  static const EMAIL = "email";
  static const ID = "id";
  static const CART = "cart";
//static const TOTALCARTPRICE = "totalcartPrice ";

  String _name;
  String _email;
  String _id;
  List _likedFood;
  List _likedRestaurents;

  int _priceSum = 0;
  int _quantitySum = 0;

//  getters
  String get name => _name;
  String get email => _email;
  String get id => _id;
  List get likedFood => _likedFood;
  List get likedRestaurents => _likedRestaurents;
  //List cart;

//public variables
  List cart;
  int totalCartPrice;

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    _name = snapshot.data[NAME];
    _email = snapshot.data[EMAIL];
    _id = snapshot.data[ID];
    cart = snapshot.data[CART] ?? [];
   totalCartPrice = snapshot.data[CART]== null ? 0 :getTotalPrice(cart: snapshot.data[CART]);
    
  }

  int getTotalPrice({List cart}) {
      if(cart == null){
      return 0;
    }
    for(Map cartItem in cart){
      _priceSum += cartItem["price"] * cartItem["quantity"];
    }

    int total = _priceSum;

    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");
    print("THE TOTAL IS $total");

    return total;
  }

  // List<CartItemModel> _convertCartItems(List<Map> cart) {
  //   List<CartItemModel> convertedCart = [];
  //   for (Map cartItem in cart) {
  //     convertedCart.add(CartItemModel.fromMap(cartItem));
  //   }

  //   return convertedCart;
  // }
}

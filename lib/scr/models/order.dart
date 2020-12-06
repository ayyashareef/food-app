import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderModel {
  static const ID = "id";
  static const DESCRIPTION = "description";
  static const CART = "cart";
  static const USER_ID = "userId";
  static const TOTAL = "total";
  static const STATUS = "status";
  static const CREATED_AT = "createdAt";
  static const RESTAURANT_ID = "restaurantId";

  String _id;
  String _restaurantId;
  String _description;
  String _userId;
  int _totalPrice;
  String _status;
  int _createdAt;

  //GETTERS

  String get id => _id;
  String get restaurantId => _restaurantId;
  String get description => _description;
  String get productId => _userId;
  int get totalPrice => _totalPrice;
  String get status => _status;
  int get createdAt => _createdAt;
  //public

  List cart;

  OrderModel.fromSnapshopt(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _description = snapshot.data[DESCRIPTION];
    _userId = snapshot.data[USER_ID];
    _totalPrice = snapshot.data[TOTAL];
    _status = snapshot.data[STATUS];
    _createdAt = snapshot.data[CREATED_AT];
    _restaurantId = snapshot.data[RESTAURANT_ID];
    cart = snapshot.data[CART];
  }
}

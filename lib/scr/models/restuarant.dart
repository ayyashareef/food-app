import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RestaurantModel {
  static const ID = "id";
  static const NAME = "name";
  static const AVG_PRICE = "avgPrice";
  static const RATING = "rating";
  static const IMAGE = "image";
  static const RATES = "rates";
  static const POPULAR = "popular";
  static const STATUS = "status";

  String _id;
  String _name;
  int _avgPrice;
  double _rating;
  String _image;
  bool _popular;
  String _status;
  int _rates;

  //GETTERS

  String get id => _id;
  String get name => _name;
  String get status => _status;
  int get avgPrice => _avgPrice;
  double get rating => _rating;
  bool get popular => _popular;
  String get image => _image;
  int get rates => _rates;

  RestaurantModel.fromSnapshopt(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _status = snapshot.data[STATUS];
    _avgPrice = snapshot.data[AVG_PRICE];
    _rating = snapshot.data[RATING];
    _popular = snapshot.data[POPULAR];
    _image = snapshot.data[IMAGE];
    _rates = snapshot.data[RATES];

  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';

class ProductModel {
  static const ID = "id";
  static const NAME = "name";

  static const RESTAURANTID = "restaurandId";
  static const RESTAURANT = "restaurand";
  static const CATEGORY = "category";
  static const IMAGE = "image";
  static const RATING = "rating";
  static const PRICE = "price";
  static const RATES = "rates";
  static const FEATURED = "featured";
  static const DESCRIPTION = "description";

  int _id;
  String _name;
  String _restaurantId;
  String _restaurant;
  String _category;
  String _image;
  double _rating;
  String _description;
  int _price;
  int _rates;
  bool _featured;

  int get id => _id;
  String get name => _name;
  String get resturantId => _restaurantId;
  String get resturant => _restaurant;
  String get category => _category;
  double get rating => _rating;
  int get price => _price;
  int get rates => _rates;
  String get image => _image;
  bool get featured => _featured;
  String get description => _description;


  ProductModel.fromSnapshopt(DocumentSnapshot snapshot) {
    _id = snapshot.data[ID];
    _name = snapshot.data[NAME];
    _restaurantId = snapshot.data[RESTAURANT];
    _restaurant = snapshot.data[RESTAURANT];
    _category = snapshot.data[CATEGORY];
    _rating = snapshot.data[RATING];
    _rates = snapshot.data[RATES];
    _image = snapshot.data[IMAGE];
    _price = snapshot.data[PRICE];
    _featured = snapshot.data[FEATURED];
    _description = snapshot.data[DESCRIPTION];
  }
}

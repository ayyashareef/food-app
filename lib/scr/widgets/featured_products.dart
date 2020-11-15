import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:woodberry/scr/models/products.dart';

import '../../commons.dart';
import 'custom_text.dart';

List<Product> productsList = [
  Product(
      name: "Salad",
      image: "2.jpg",
      rating: 4.7,
      price: 50,
      vendor: "goodfood",
      wishList: false),
  Product(
      name: "Fried Noodles",
      image: "1.jpg",
      rating: 4.7,
      price: 55,
      vendor: "gooood",
      wishList: true),
  Product(
      name: "Spegetti",
      image: "3.jpg",
      rating: 4.9,
      price: 65,
      vendor: "gooood",
      wishList: true),
];

class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: productsList.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                height: 240,
                width: 200,
                decoration: BoxDecoration(color: white, boxShadow: [
                  BoxShadow(color: white, offset: Offset(1, 1), blurRadius: 0),
                ]),
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "images/${productsList[index].image}",
                      height: 140,
                      width: 140,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: CustomText(text: productsList[index].name),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: productsList[index].wishList
                              ? Icon(
                                  Icons.favorite,
                                  color: red,
                                  size: 18,
                                )
                              : Icon(
                                  Icons.favorite_border,
                                  color: red,
                                  size: 18,
                                )),
                      Container(
                        decoration: BoxDecoration(color: grey, boxShadow: [
                          BoxShadow(
                              color: white,
                              offset: Offset(1, 1),
                              blurRadius: 10),
                        ]),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: CustomText(
                              text: productsList[index].rating.toString(),
                              color: grey,
                              size: 14,
                            ),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Icon(
                            Icons.star,
                            color: red,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: red,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: red,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: red,
                            size: 16,
                          ),
                          Icon(
                            Icons.star,
                            color: grey,
                            size: 16,
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: CustomText(
                          text: productsList[index].price.toString(),
                          weight: FontWeight.bold,
                        ),
                      )
                    ],
                  )
                ]),
              ),
            );
          }),
    );
  }
}

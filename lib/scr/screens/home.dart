import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:woodberry/commons.dart';
import 'package:woodberry/scr/models/category.dart';
import 'package:woodberry/scr/widgets/bottom_navigation_icons.dart';
import 'package:woodberry/scr/widgets/custom_text.dart';
import 'package:woodberry/scr/widgets/featured_products.dart';
import 'package:woodberry/scr/widgets/small_floating_button.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
          child: ListView(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomText(
                  text: "What would you like to eat ? ",
                  size: 20,
                  color: black,
                )),
            Stack(
              children: [
                IconButton(
                    icon: Icon(Icons.notifications_none), onPressed: () {}),
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                          color: red, borderRadius: BorderRadius.circular(20))),
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              decoration: BoxDecoration(color: white, boxShadow: [
                BoxShadow(color: grey, offset: Offset(1, 1), blurRadius: 4),
              ]),
              child: ListTile(
                leading: Icon(
                  Icons.search,
                  color: red,
                ),
                title: TextField(
                  decoration: InputDecoration(
                      hintText: "Find Foods", border: InputBorder.none),
                ),
                trailing: Icon(Icons.filter_list, color: red),
              )),
        ),
        SizedBox(
          height: 5,
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset("images/banner.png")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(5)),
                
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Categories(),
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomText(
              text: "Featured",
              size: 20,
              color: grey,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Featured(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 9),
          child: CustomText(
            text: "Popular",
            size: 20,
            color: grey,
          ),
        ),
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 6),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset("images/food.png")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(5)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallButton(Icons.favorite),
                    Padding(
                      padding: const EdgeInsets.all(0),
                      child: Icon(
                        Icons.favorite,
                        color: red,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ])),
      bottomNavigationBar: Container(
        height: 73,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavIcon(image: "home.png",
            name: "Home",),

            
             BottomNavIcon(image: "avatar.png",
            name: "Profile",),
             BottomNavIcon(image: "shopping-bag.png",
            name: "Cart",),
            
            
            
          ],
        ),
      ),
    );
  }
}

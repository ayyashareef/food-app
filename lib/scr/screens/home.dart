import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:food_course/scr/helpers/screen_navigation.dart';
import 'package:food_course/scr/helpers/style.dart';
import 'package:food_course/scr/provider/app.dart';
import 'package:food_course/scr/provider/app.dart';
import 'package:food_course/scr/provider/app.dart';
import 'package:food_course/scr/provider/auth.dart';
import 'package:food_course/scr/provider/category.dart';
import 'package:food_course/scr/provider/product.dart';
import 'package:food_course/scr/provider/restaurant.dart';
import 'package:food_course/scr/screens/cart.dart';
import 'package:food_course/scr/screens/category.dart';
import 'package:food_course/scr/screens/login.dart';
import 'package:food_course/scr/screens/order.dart';
import 'package:food_course/scr/screens/product_search.dart';
import 'package:food_course/scr/screens/restaurant.dart';
import 'package:food_course/scr/screens/restaurants_search.dart';
import 'package:food_course/scr/widgets/bottom_navigation_icons.dart';
import 'package:food_course/scr/widgets/categories.dart';
import 'package:food_course/scr/widgets/custom_text.dart';
import 'package:food_course/scr/widgets/featured_products.dart';
import 'package:food_course/scr/widgets/loading.dart';
import 'package:food_course/scr/widgets/restaurant.dart';
import 'package:food_course/scr/widgets/small_floating_button.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context);
    final app = Provider.of<AppProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final productProvider = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: white),
        elevation: 0.5,
        backgroundColor: primary,
        title: CustomText(
          text: "FoodApp",
          color: white,
        ),
        actions: <Widget>[
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  changeScreen(context, CartScreen());
                },
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: green, borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ],
          ),
          Stack(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.notifications),
                onPressed: () {},
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                      color: green, borderRadius: BorderRadius.circular(20.0)),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: primary),
              accountName: CustomText(
                text: user.userModel?.name,
                color: white,
                weight: FontWeight.bold,
                size: 18,
              ),
              accountEmail: CustomText(
                text: user.userModel?.email,
                color: white,
              ),
            ),
            ListTile(
              onTap: () {
                changeScreen(context, Home());
              },
              leading: Icon(Icons.home),
              title: CustomText(text: "Home"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.fastfood),
              title: CustomText(text: "Food I like"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.restaurant),
              title: CustomText(text: "Liked restaurants"),
            ),
            ListTile(
              onTap: () async{
                await user.getOrders();
                changeScreen(context, OrdersScreen());
              },
              leading: Icon(Icons.bookmark_border),
              title: CustomText(text: "My orders"),
            ),
            ListTile(
              onTap: () {
                changeScreen(context, CartScreen());
              },
              leading: Icon(Icons.shopping_cart),
              title: CustomText(text: "Cart"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.settings),
              title: CustomText(text: "Settings"),
            ),
            ListTile(
              onTap: () {
                user.signOut();
                changeScreenReplacement(context, LoginScreen());
              },
              leading: Icon(Icons.exit_to_app),
              title: CustomText(text: "Log Out"),
            ),
          ],
        ),
      ),
      backgroundColor: white,
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, left: 8, right: 8, bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.search,
                      color: red,
                    ),
                    title: TextField(
                      textInputAction: TextInputAction.search,
                      onSubmitted: (pattern) async {
                        app.changeLoading();
                        if (app.search == SearchBy.PRODUCTS) {
                          await productProvider.search(productName: pattern);
                          changeScreen(context, ProductSearchScreen());
                        } else {
                          await restaurantProvider.search(name: pattern);
                          changeScreen(context, RestaurantsSearchScreen());
                        }

                        app.changeLoading();
                      },
                      decoration: InputDecoration(
                        hintText: "Find food and restaurant",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                CustomText(
                  text: "Search by:",
                  color: grey,
                  weight: FontWeight.w300,
                ),
                DropdownButton<String>(
                  value: app.filterBy,
                  style: TextStyle(color: primary, fontWeight: FontWeight.w300),
                  icon: Icon(
                    Icons.filter_list,
                    color: primary,
                  ),
                  elevation: 0,
                  onChanged: (value) {
                    if (value == "foods") {
                      app.changeSearchBy(newSearchBy: SearchBy.PRODUCTS);
                    } else {
                      app.changeSearchBy(newSearchBy: SearchBy.RESTAURANTS);
                    }
                  },
                  items: <String>["Products", "restaurants"]
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                ),
              ],
            ),
            Divider(),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryProvider.categories.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
//                              app.changeLoading();
                        await productProvider.loadProductsByCategory(
                            categoryName:
                                categoryProvider.categories[index].name);

                        changeScreen(
                            context,
                            CategoryScreen(
                              categoryModel: categoryProvider.categories[index],
                            ));

//                              app.changeLoading();
                      },
                      child: CategoryWidget(
                        category: categoryProvider.categories[index],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    text: "Featured",
                    size: 20,
                    color: grey,
                  ),
                  CustomText(
                    text: "see all",
                    size: 14,
                    color: primary,
                  ),
                ],
              ),
            ),
            Featured(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  CustomText(
                    text: "Popular Restaurant",
                    size: 20,
                    color: grey,
                  ),
                  CustomText(
                    text: "see all",
                    size: 14,
                    color: primary,
                  ),
                ],
              ),
            ),
            Column(
              children: restaurantProvider.restaurants
                  .map((item) => GestureDetector(
                        onTap: () async {
                          app.changeLoading();
                          await productProvider.loadProductsByRestaurant(
                              restaurantId: item.id);

                          changeScreen(
                              context,
                              RestaurantScreen(
                                restaurantModel: item,
                              ));
                        },
                        child: Restaurantwidget(
                          restaurant: item,
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

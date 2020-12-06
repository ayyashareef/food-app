import 'package:flutter/material.dart';
import 'package:food_course/scr/provider/app.dart';
import 'package:food_course/scr/provider/auth.dart';
import 'package:food_course/scr/provider/category.dart';
import 'package:food_course/scr/provider/product.dart';
import 'package:food_course/scr/provider/restaurant.dart';

import 'package:food_course/scr/screens/home.dart';
import 'package:food_course/scr/screens/login.dart';
import 'package:food_course/scr/widgets/loading.dart';
import 'package:provider/provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider.value(value: AppProvider()),
    ChangeNotifierProvider.value(value: AuthProvider.initialize()),
     ChangeNotifierProvider.value(value: CategoryProvider.initialize()),
     ChangeNotifierProvider.value(value: RestaurantProvider.initialize()),
     ChangeNotifierProvider.value(value: ProductProvider.initialize()),
  ],
  child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ScreensController()
  )));
}


class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    switch(auth.status){
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return Home();
      default: return LoginScreen();
    }
  }
}

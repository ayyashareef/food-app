import 'package:flutter/material.dart';
import 'package:food_course/scr/helpers/style.dart';
import 'package:food_course/scr/models/order.dart';
import 'package:food_course/scr/provider/app.dart';
import 'package:food_course/scr/provider/auth.dart';

import 'package:food_course/scr/widgets/custom_text.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
   
    

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: black),
        backgroundColor: white,
        elevation: 0.0,
        title: CustomText(text: "Orders"),
        leading: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      backgroundColor: white,
      body: ListView.builder(
         itemCount: auth.orders.length,
          itemBuilder: (_, index){
            OrderModel _order = auth.orders[index];
            return ListTile(
              leading: CustomText(
                text: "\MVR${_order.totalPrice }",
                weight: FontWeight.bold,
              ),
              title: Text(_order.description),
              subtitle: Text(DateTime.fromMillisecondsSinceEpoch(_order.createdAt).toString()),
              trailing: CustomText(text: _order.status, color: green,),
            );
        }),
    );
  }
}

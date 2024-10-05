import 'package:flutter/material.dart';
import 'package:food_delivery_app/login.dart';
import 'package:food_delivery_app/profile/orders.dart';
import 'package:food_delivery_app/profile/user.dart';
import 'cart.dart';
import 'homepage/main_food_page.dart';
import 'register.dart';
import 'package:food_delivery_app/profile/profile.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'main_food_page' : (context)=> MainFoodPage(),
      'login' : (context)=> Mylogin(),
      'register' : (context)=> MyRegister(),
      'profile': (context)=>MyProfile(),
      'cart': (context)=> MyCart(),
      '/user':(context)=> Profile_Screen2(),
      '/orders':(context)=> OrderScreen()
    },
  ));
}


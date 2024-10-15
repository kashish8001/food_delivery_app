import 'package:flutter/material.dart';
import 'package:food_delivery_app/login.dart';
import 'package:food_delivery_app/profile/orders.dart';
import 'package:food_delivery_app/profile/user.dart';
import 'widgets/cart.dart';
import 'homepage/main_food_page.dart';
import 'register.dart';
import 'package:food_delivery_app/profile/profile.dart';
import 'package:food_delivery_app/Bot/chatBot.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'main_food_page',
    routes: {
      'main_food_page' : (context)=> MainFoodPage(),
      'login' : (context)=> Mylogin(),
      'register' : (context)=> MyRegister(),
      'profile': (context)=>MyProfile(),
      'cart': (context)=> MyCart(),
      '/user':(context)=> Profile_Screen2(),
      '/orders':(context)=> OrderScreen(),
     '/chatbot':(context)=> BotpressChat(botUrl: 'https://cdn.botpress.cloud/webchat/v2.2/shareable.html?configUrl=https://files.bpcontent.cloud/2024/10/15/17/20241015170123-2JIB60O6.json',)
    },
  ));
}



import 'package:flutter/material.dart';
import 'package:food_delivery_app/login.dart';
import 'package:food_delivery_app/profile/orders.dart';
import 'package:food_delivery_app/profile/premium.dart';
import 'package:food_delivery_app/profile/user.dart';
import 'widgets/cart.dart';
import 'homepage/main_food_page.dart';
import 'register.dart';
import 'welcome.dart';
import 'splash_screen.dart';
import 'package:food_delivery_app/profile/profile.dart';
import 'package:food_delivery_app/Bot/chatBot.dart';
import 'profile/faq.dart';
import 'profile/premium.dart';
import 'profile/feedback.dart';
import 'profile/eat_with_friends.dart';
import 'profile/subscribe_&_save.dart';
import 'profile/address.dart';
import 'profile/refund.dart';
import 'profile/payment_mode.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'splash_screen',
    routes: {
      'splash_screen' : (context)=> SplashScreen(),
      'main_food_page' : (context)=> MainFoodPage(),
      'login' : (context)=> Mylogin(),
      'welcome' : (context)=> MyWelcome(),
      'register' : (context)=> MyRegister(),
      'profile': (context)=>MyProfile(),
      '/faq': (context)=> FAQPage(),
      '/feedback': (context)=> FeedbackPage(),
      '/refund': (context)=> RefundStatusScreen(),
      '/payment_mode': (context)=> PaymentsScreen(),
      '/premium' : (context)=> PremiumScreen(),
      '/address' : (context)=> AddressScreen(),
      '/eat_with_friends': (context)=> EatWithFriendsPage(),
      '/subscribe_&_save': (context)=> SubscribeAndSavePage(),
      'cart': (context)=> MyCart(),
      '/user':(context)=> Profile_Screen2(),
      '/orders':(context)=> OrderScreen(),
      '/chatBot':(context)=> BotpressChat(botUrl: 'https://cdn.botpress.cloud/webchat/v2.2/shareable.html?configUrl=https://files.bpcontent.cloud/2024/10/15/17/20241015170123-2JIB60O6.json',)
    },
  ));
}



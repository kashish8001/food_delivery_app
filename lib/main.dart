import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/login.dart';
import 'package:food_delivery_app/profile/orders.dart';
import 'package:food_delivery_app/profile/user.dart';
import 'package:food_delivery_app/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';
import 'widgets/cart.dart';
import 'firebase_options.dart';
import 'homepage/main_food_page.dart';
import 'register.dart';
import 'package:food_delivery_app/profile/profile.dart';

import 'package:food_delivery_app/profile/premium.dart';
import 'widgets/end_screen.dart';
import 'widgets/order_success_screen.dart';
import 'widgets/payment_method.dart';
import 'widgets/shipping_address.dart';
import 'welcome.dart';
import 'splash_screen.dart';
import 'package:food_delivery_app/Bot/chatBot.dart';
import 'profile/faq.dart';
import 'profile/feedback.dart';
import 'profile/eat_with_friends.dart';
import 'profile/subscribe_&_save.dart';
import 'profile/address.dart';
import 'profile/refund.dart';
import 'profile/payment_mode.dart';

List<CartItem> cartItems = [];

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(GetMaterialApp(
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
      '/cart': (context)=> MyCart(),
      '/end_screen': (context)=> EndScreen(),
      '/order_confirm_screen': (context)=> PaymentMethod(),
      '/order_success_screen': (context)=> OrderSuccessScreen(),
      '/payment_method': (context)=> PaymentMethod(),
      '/shipping_address': (context)=> ShippingAddress(totalitems: 0, subTotal: 0,),
      '/user':(context)=> Profile_Screen2(),
      '/orders':(context)=> OrderScreen(),
      '/chatBot':(context)=> BotpressChat(botUrl: 'https://cdn.botpress.cloud/webchat/v2.2/shareable.html?configUrl=https://files.bpcontent.cloud/2024/10/15/17/20241015170123-2JIB60O6.json',)
    },
  ));
}

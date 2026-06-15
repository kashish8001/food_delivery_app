import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/homepage/main_food_page.dart';
import 'package:food_delivery_app/repository/authentication_repository/authentication_repository.dart';
import 'package:food_delivery_app/repository/user_repository/user_repository.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class SignUpController extends GetxController {
 static SignUpController get instance => Get.find();

 final name = TextEditingController();
 final email = TextEditingController();
 final password = TextEditingController();
 final phone = TextEditingController();

 final userRepo = Get.put(UserRepository());

 // Method to register user
 void registerUser(String email, String password) {
  AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
 }

 Future<void> createUser(UserModel user) async{
  await userRepo.createUser(user);
  Get.to(() => const MainFoodPage());
 }

 // Method to clear text fields (called after logout)
 void clearTextFields() {
  name.clear();
  email.clear();
  password.clear();
  phone.clear();
 }

 // Method to handle user logout and clear the fields
 Future<void> signOutUser() async {
  await AuthenticationRepository.instance.logout();
  clearTextFields();  // Clear the text fields after logout
 }
}

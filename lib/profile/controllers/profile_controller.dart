import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

import '../../authentication/models/user_model.dart';
import '../../repository/user_repository/user_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  // Controllers
  final email = TextEditingController();
  final password = TextEditingController();
  final name = TextEditingController();

  // Repositories
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  // Get user email & pass to UserRepository to fetch user record
  getUserData() {
    final email = _authRepo.firebaseUser.value?.email;
    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue.");
      return null;  // Return null if no email is found
    }
  }

  // Fetch List of user records
  Future<List<UserModel>> getAllUsers() async => await _userRepo.allUsers();

  // Update user record
  updateRecord(UserModel user) async {
    try {
      print("Updating user: ${user.toJson()}");  // Log the user data being updated

      // Attempt to update the user record
      await _userRepo.updateUserRecord(user);
      Get.snackbar("Success", "Profile updated successfully.");
    } catch (e) {
      // Catch and log any errors during the Firestore update
      print("Error while updating user: $e");
      Get.snackbar("Error", "Failed to update profile: $e");
    }
  }
}




// import 'package:flutter/cupertino.dart';
// import 'package:food_delivery_app/repository/authentication_repository/authentication_repository.dart';
// import 'package:get/get.dart';
//
// import '../../authentication/models/user_model.dart';
// import '../../repository/user_repository/user_repository.dart';
//
// class ProfileController extends GetxController{
//   static ProfileController get instance => Get.find();
//
//   // Controllers
//   final email = TextEditingController();
//   final password = TextEditingController();
//   final name = TextEditingController();
//
//   // Repositories
//   final _authRepo = Get.put(AuthenticationRepository());
//   final _userRepo = Get.put(UserRepository());
//
//   // Get user email & pass to UserRepository to fetch user record
//   getUserData(){
//     final email = _authRepo.firebaseUser.value?.email;
//     if(email != null){
//       return _userRepo.getUserDetails(email);
//     } else {
//       Get.snackbar("Error", "Login to continue.");
//
//     }
//   }
//
//   // Fetch List of user records
//   Future<List<UserModel>> getAllUsers() async => await _userRepo.allUsers();
//
//   // Update user record
//   updateRecord(UserModel user) async {
//     await _userRepo.updateUserRecord(user);
// }
// }

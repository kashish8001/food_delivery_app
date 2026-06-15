import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../authentication/models/user_model.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;


  // Store user in FireStore and save the document ID in the user's record
  Future<void> createUser(UserModel user) async {
    try {
      // Add the user and get the generated document ID
      DocumentReference docRef = await _db.collection("Users").add(user.toJson());

      // Update the user's record to include the document ID
      await _db.collection("Users").doc(docRef.id).update({"id": docRef.id});

      // Notify success
      Get.snackbar("Success", "Your account has been created.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green.withOpacity(0.1),
          colorText: Colors.green);
    } catch (error) {
      // Handle errors
      Get.snackbar("Error", "Something went wrong. Try again.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print("Error creating user: $error");
    }
  }

  // Fetch All Users OR User Details
  Future<UserModel> getUserDetails(String email) async{
    final snapshot = await _db.collection("Users").where("Email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userData;
  }

  Future<List<UserModel>> allUsers() async{
    final snapshot = await _db.collection("Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }

  // Update user record
  Future<void> updateUserRecord(UserModel user) async {
    try {
      // Ensure that the user has an ID before attempting to update
      if (user.id != null) {
        await _db.collection("Users").doc(user.id).update(user.toJson());
        Get.snackbar("Success", "User record updated successfully.",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green.withOpacity(0.1),
            colorText: Colors.green);
      } else {
        throw Exception("User ID is missing.");
      }
    } catch (error) {
      print("Error updating user: $error");
      Get.snackbar("Error", "Failed to update user record.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    }
  }

  // Future<void> updateUserRecord(UserModel user) async {
  //   try {
  //     if (user.id != null && user.id!.isNotEmpty) {
  //       print("Updating user with ID: ${user.id}");
  //
  //       // Debugging: Print the data to be updated
  //       print("Data to be updated: ${user.toJson()}");
  //
  //       await _db.collection("Users").doc(user.id).update(user.toJson());
  //
  //       Get.snackbar("Success", "User record updated successfully.",
  //           snackPosition: SnackPosition.BOTTOM,
  //           backgroundColor: Colors.green.withOpacity(0.1),
  //           colorText: Colors.green);
  //     } else {
  //       throw Exception("User ID is missing or empty.");
  //     }
  //   } catch (error) {
  //     print("Error updating user: $error");
  //     Get.snackbar("Error", "Failed to update user record. Error: $error",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.redAccent.withOpacity(0.1),
  //         colorText: Colors.red);
  //   }
  // }


// Future<void> updateUserRecord(UserModel user) async{
  //   await _db.collection("Users").doc(user.id).update(user.toJson());
  // }
}
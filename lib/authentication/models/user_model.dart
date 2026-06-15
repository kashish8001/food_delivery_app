import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel{
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String password;

  const UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
});

  toJson(){
    return {
      "Name": name,
      "Email": email,
      "Phone No": phone,
      "Password": password,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data["Email"],
      password: data["Password"],
      name: data["Name"],
      phone: data["Phone No"],
    );
  }
}
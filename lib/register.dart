import 'package:flutter/material.dart';
import 'package:food_delivery_app/authentication/controllers/signup_controller.dart';
import 'package:get/get.dart';

import 'authentication/models/user_model.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  // Create individual form keys for each field
  final _nameKey = GlobalKey<FormState>();
  final _emailKey = GlobalKey<FormState>();
  final _phoneKey = GlobalKey<FormState>();
  final _passwordKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/register.png'), fit: BoxFit.cover)),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 9),
              child: const Text(
                'Create\nAccount',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.23,
                    right: 35,
                    left: 35),
                child: Column(
                  children: [
                    // Name Input Field
                    Form(
                      key: _nameKey,
                      child: TextFormField(
                        controller: controller.name,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black)),
                          hintText: 'Name',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Email Input Field
                    Form(
                      key: _emailKey,
                      child: TextFormField(
                        controller: controller.email,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black)),
                          hintText: 'Email',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Phone Input Field
                    Form(
                      key: _phoneKey,
                      child: TextFormField(
                        controller: controller.phone,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black)),
                          hintText: 'Phone No',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (value) {
                          // Regular expression for validating phone number
                          final RegExp phoneRegExp = RegExp(
                            r'^\+?[0-9]{10,15}$',  // Adjust the regex pattern as per your requirements
                          );

                          if (value == null || value.isEmpty) {
                            return 'Phone number is required';
                          } else if (!phoneRegExp.hasMatch(value)) {
                            return 'Invalid phone number format';
                          }
                          return null; // Return null if validation passes
                        },
                      ),
                    ),
                    const SizedBox(height: 30),


                    // Password Input Field
                    Form(
                      key: _passwordKey,
                      child: TextFormField(
                        controller: controller.password,
                        obscureText: true, // To hide password input
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.black)),
                          hintText: 'Password',
                          hintStyle: const TextStyle(color: Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters long';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Sign Up Button
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff4c505b),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Validate each field separately
                          final isNameValid = _nameKey.currentState!.validate();
                          final isEmailValid = _emailKey.currentState!.validate();
                          final isPhoneValid = _phoneKey.currentState!.validate();
                          final isPasswordValid = _passwordKey.currentState!.validate();

                          if (isNameValid && isEmailValid && isPasswordValid) {
                            // If all forms are valid, proceed with sign-up logic
                            SignUpController.instance.registerUser(
                                controller.email.text.trim(),
                                controller.password.text.trim(),
                            );
                            final user = UserModel(
                              email: controller.email.text.trim(),
                              phone: controller.phone.text.trim(),
                              password: controller.password.text.trim(),
                              name: controller.name.text.trim(),
                            );
                            SignUpController.instance.createUser(user);
                            Navigator.pushNamed(
                                context, 'main_food_page'); // Navigate to home screen
                          }
                        },
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Social Media Sign In
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Handle Google Sign In
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: Image.asset('assets/google.png'),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                        const SizedBox(width: 40),
                        GestureDetector(
                          onTap: () {
                            // Handle Facebook Sign In
                          },
                          child: Column(
                            children: [
                              SizedBox(
                                width: 40,
                                height: 40,
                                child: Image.asset('assets/facebook.png'),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
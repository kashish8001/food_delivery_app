
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../authentication/models/user_model.dart';
import 'controllers/profile_controller.dart';

class Profile_Screen2 extends StatefulWidget {
  const Profile_Screen2({super.key});

  @override
  State<Profile_Screen2> createState() => _Profile_Screen2State();
}

class _Profile_Screen2State extends State<Profile_Screen2> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Your Profile', style: TextStyle(fontSize: 24)),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: FutureBuilder(
                  future: controller.getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        UserModel user = snapshot.data as UserModel;

                        // Controllers
                        final email = TextEditingController(text: user.email);
                        final phone = TextEditingController(text: user.phone);
                        final password = TextEditingController(text: user.password);
                        final name = TextEditingController(text: user.name);

                        return Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              // Name Field
                              TextFormField(
                                controller: name,
                                // initialValue: userData.name,
                                decoration: InputDecoration(
                                  labelText: 'Name',
                                  labelStyle: const TextStyle(color: Colors.black),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.blueAccent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.grey),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 20),

                              // Phone Field
                              TextFormField(
                                controller: phone,
                                // initialValue: userData.name,
                                decoration: InputDecoration(
                                  labelText: 'Phone No',
                                  labelStyle: const TextStyle(color: Colors.black),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.blueAccent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.grey),
                                  ),
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
                              const SizedBox(height: 20),

                              // Email Field
                              TextFormField(
                                controller: email,
                                // initialValue: userData.email,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: const TextStyle(color: Colors.black),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.blueAccent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.grey),
                                  ),
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
                              const SizedBox(height: 20),

                              // Password Field
                              TextFormField(
                                controller: password,
                                // initialValue: userData.password,
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  labelStyle: const TextStyle(color: Colors.black),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.blueAccent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(color: Colors.grey),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 30),

                              // Save Button
                               ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    // If all fields are valid, proceed with saving
                                    // Implement save functionality
                                    final userData = UserModel (
                                      email: email.text.trim(),
                                      phone: phone.text.trim(),
                                      password: password.text.trim(),
                                      name: name.text.trim(),
                                    );

                                    await controller.updateRecord(userData);
                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   const SnackBar(content: Text('Profile Updated')),
                                    // );
                                  }
                                },
                                child: const Text('Save Changes', style: TextStyle(fontSize: 16)),
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                                  // shape: RoundedRectangleBorder(
                                  //   borderRadius: BorderRadius.circular(10),
                                  // ),
                                  backgroundColor: Colors.blueAccent,
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        return const Center(child: Text('Something went wrong.'));
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}

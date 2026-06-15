import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'authentication/controllers/signup_controller.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  // Create a single form key for the entire form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 80),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.42,
                    right: 35,
                    left: 35),
                child: Form(
                  key: _formKey, // Wrap the form fields in a single Form widget
                  child: Column(
                    children: [
                      // Email Input Field
                      TextFormField(
                        controller: controller.email,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Email',
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
                      SizedBox(height: 30),

                      // Password Input Field
                      TextFormField(
                        controller: controller.password,
                        obscureText: true,
                        decoration: InputDecoration(
                          fillColor: Colors.grey.shade100,
                          filled: true,
                          hintText: 'Password',
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
                       SizedBox(height: 40),

                      // Sign In button with a new color
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xff4c505b), // Dark color for Sign In button
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextButton(
                          onPressed: () async {
                            // Validate the form
                            if (_formKey.currentState!.validate()) {
                              try {
                                // Proceed with sign-in logic
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: controller.email.text.trim(),
                                  password: controller.password.text.trim(),
                                );
                                // Navigate to the home screen
                                // Navigator.pushNamed(context, 'main_food_page');
                              } on FirebaseAuthException catch (e) {
                                // Handle different types of authentication exceptions
                                String message = 'Wrong email/ password. Please try again.';
                                // if (e.code == 'user-not-found') {
                                //   message = 'No user found for that email.';
                                // } else if (e.code == 'wrong-password') {
                                //   message =
                                //   'Wrong password provided for that user.';
                                // } else if (e.code == 'invalid-email') {
                                //   message = 'The email address is not valid.';
                                // } else if (e.code == 'operation-not-allowed') {
                                //   message = 'Sign-in method is not enabled.';
                                // } else if (e.code == 'too-many-requests') {
                                //   message =
                                //   'Too many attempts. Try again later.';
                                // } else {
                                //   message = 'An error occurred: ${e.message}';
                                // }

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(message),
                                    duration: Duration(seconds: 3),
                                  ),
                                );


                                // Show a Snackbar or a Dialog with the error message
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(message),
                                    duration: Duration(seconds: 3),
                                  ),
                                );
                              }
                            }
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white, // White text color for better contrast
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              // onPressed: () {
                          //   // Validate the form
                          //   if (_formKey.currentState!.validate()) {
                          //     // Proceed with sign-in logic
                          //     FirebaseAuth.instance.signInWithEmailAndPassword(
                          //         email: controller.email.text.trim(),
                          //         password: controller.password.text.trim());
                          //     // Navigate to the home screen
                          //     // Navigator.pushNamed(context, 'main_food_page');
                          //   }
                          // },
                          // child: Text(
                          //   'Sign In',
                          //   style: TextStyle(
                          //     color: Colors.white, // White text color for better contrast
                          //     fontSize: 20,
                          //     fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      SizedBox(height: 40),
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
                                SizedBox(height: 8),
                              ],
                            ),
                          ),
                          SizedBox(width: 40),
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
                                SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'register');
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Color(0xff4c505b),
                                ),
                              )),
                          TextButton(
                              onPressed: () {
                                // Handle forgot password action
                              },
                              child: Text(
                                'Forgot Password',
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 18,
                                  color: Color(0xff4c505b),
                                ),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'authentication/controllers/signup_controller.dart';
//
// class Mylogin extends StatefulWidget {
//   const Mylogin({super.key});
//
//   @override
//   State<Mylogin> createState() => _MyloginState();
// }
//
// class _MyloginState extends State<Mylogin> {
//   // Create individual form keys for each field
//   final _emailKey = GlobalKey<FormState>();
//   final _passwordKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(SignUpController());
//     return Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             Container(
//               padding: EdgeInsets.only(left: 35, top: 80),
//               child: Text(
//                 'Welcome',
//                 style: TextStyle(color: Colors.white, fontSize: 33),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.42,
//                     right: 35,
//                     left: 35),
//                 child: Column(
//                   children: [
//                     // Email Input Field
//                     Form(
//                       key: _emailKey,
//                       child: TextFormField(
//                         controller: controller.email,
//                         decoration: InputDecoration(
//                           fillColor: Colors.grey.shade100,
//                           filled: true,
//                           hintText: 'Email',
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your email';
//                           }
//                           if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
//                             return 'Please enter a valid email address';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     SizedBox(height: 30),
//
//                     // Password Input Field
//                     Form(
//                       key: _passwordKey,
//                       child: TextFormField(
//                         controller: controller.password,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           fillColor: Colors.grey.shade100,
//                           filled: true,
//                           hintText: 'Password',
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10)),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Please enter your password';
//                           }
//                           if (value.length < 6) {
//                             return 'Password must be at least 6 characters long';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     SizedBox(height: 40),
//
//                     // Sign In button with a new color
//                     Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Color(0xff4c505b), // Dark color for Sign In button
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: TextButton(
//                         onPressed: () {
//                           // Validate both fields before proceeding
//                           final isEmailValid = _emailKey.currentState!.validate();
//                           final isPasswordValid = _passwordKey.currentState!.validate();
//
//                           if (isEmailValid && isPasswordValid) {
//                             // Proceed with sign-in logic
//                             // You can add your sign-in method here
//                             FirebaseAuth.instance.signInWithEmailAndPassword(
//                                 email: controller.email.text.trim(),
//                                 password: controller.password.text.trim()
//                             );
//                             // Navigator.pushNamed(context, 'main_food_page'); // Navigate to home screen
//                           }
//                         },
//                         child: Text(
//                           'Sign In',
//                           style: TextStyle(
//                             color: Colors.white, // White text color for better contrast
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     SizedBox(height: 40),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             // Handle Google Sign In
//                           },
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 width: 40,
//                                 height: 40,
//                                 child: Image.asset('assets/google.png'),
//                               ),
//                               SizedBox(height: 8),
//                             ],
//                           ),
//                         ),
//                         SizedBox(width: 40),
//                         GestureDetector(
//                           onTap: () {
//                             // Handle Facebook Sign In
//                           },
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 width: 40,
//                                 height: 40,
//                                 child: Image.asset('assets/facebook.png'),
//                               ),
//                               SizedBox(height: 8),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 40),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         TextButton(
//                             onPressed: () {
//                               Navigator.pushNamed(context, 'register');
//                             },
//                             child: Text(
//                               'Sign Up',
//                               style: TextStyle(
//                                 decoration: TextDecoration.underline,
//                                 fontSize: 18,
//                                 color: Color(0xff4c505b),
//                               ),
//                             )),
//                         TextButton(
//                             onPressed: () {
//                               // Handle forgot password action
//                             },
//                             child: Text(
//                               'Forgot Password',
//                               style: TextStyle(
//                                 decoration: TextDecoration.underline,
//                                 fontSize: 18,
//                                 color: Color(0xff4c505b),
//                               ),
//                             )),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import 'authentication/controllers/signup_controller.dart';
//
// class Mylogin extends StatefulWidget {
//   const Mylogin({super.key});
//
//   @override
//   State<Mylogin> createState() => _MyloginState();
// }
//
// class _MyloginState extends State<Mylogin> {
//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(SignUpController());
//     return Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(image: AssetImage('assets/login.png'), fit: BoxFit.cover)),
//       child: Scaffold(
//         backgroundColor: Colors.transparent,
//         body: Stack(
//           children: [
//             Container(
//               padding: EdgeInsets.only(left: 35, top: 80),
//               child: Text(
//                 'Welcome',
//                 style: TextStyle(color: Colors.white, fontSize: 33),
//               ),
//             ),
//             SingleChildScrollView(
//               child: Container(
//                 padding: EdgeInsets.only(
//                     top: MediaQuery.of(context).size.height * 0.42,
//                     right: 35,
//                     left: 35),
//                 child: Column(
//                   children: [
//                     TextField(
//                       decoration: InputDecoration(
//                           fillColor: Colors.grey.shade100,
//                           filled: true,
//                           hintText: 'Email',
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10))),
//                     ),
//                     SizedBox(
//                       height: 30,
//                     ),
//                     TextField(
//                       obscureText: true,
//                       decoration: InputDecoration(
//                           fillColor: Colors.grey.shade100,
//                           filled: true,
//                           hintText: 'Password',
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(10))),
//                     ),
//                     SizedBox(
//                       height: 40,
//                     ),
//
//                     // Sign In button with a new color
//                     Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Color(0xff4c505b), // Dark color for Sign In button
//                         borderRadius: BorderRadius.circular(10),
//                       ),
//                       child: TextButton(
//                         onPressed: () {
//                           Navigator.pushNamed(context, 'main_food_page'); // Navigate to home screen
//                         },
//                         child: Text(
//                           'Sign In',
//                           style: TextStyle(
//                             color: Colors.white, // White text color for better contrast
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                     ),
//
//                     SizedBox(
//                       height: 40,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             // Handle Google Sign In
//                           },
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 width: 40,
//                                 height: 40,
//                                 child: Image.asset('assets/google.png'),
//                               ),
//                               SizedBox(height: 8),
//                             ],
//                           ),
//                         ),
//                         SizedBox(width: 40),
//                         GestureDetector(
//                           onTap: () {
//                             // Handle Facebook Sign In
//                           },
//                           child: Column(
//                             children: [
//                               SizedBox(
//                                 width: 40,
//                                 height: 40,
//                                 child: Image.asset('assets/facebook.png'),
//                               ),
//                               SizedBox(height: 8),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       height: 40,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         TextButton(
//                             onPressed: () {
//                               Navigator.pushNamed(context, 'register');
//                             },
//                             child: Text(
//                               'Sign Up',
//                               style: TextStyle(
//                                 decoration: TextDecoration.underline,
//                                 fontSize: 18,
//                                 color: Color(0xff4c505b),
//                               ),
//                             )),
//                         TextButton(
//                             onPressed: () {},
//                             child: Text(
//                               'Forgot Password',
//                               style: TextStyle(
//                                 decoration: TextDecoration.underline,
//                                 fontSize: 18,
//                                 color: Color(0xff4c505b),
//                               ),
//                             ))
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

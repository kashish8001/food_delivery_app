import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyProfile(),
    );
  }
}

class MyProfile extends StatelessWidget {
  // int currentIndex = 0;

  MyProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Profile'),
      ),
      body: SingleChildScrollView( // Add scroll view here
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/profile.jpg'),
              ),
              SizedBox(height: 10),
              Text(
                'Username',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ProfileMenuItem(
                title: 'Your Profile',
                onTap: () {
                  Navigator.pushNamed(context, '/user');
                },
              ),
              ProfileMenuItem(
                title: 'Your Orders',
                onTap: () {
                  Navigator.pushNamed(context, '/orders');
                },
              ),
              ProfileMenuItem(title: 'Payment & Refunds', onTap: () {}),
              ProfileMenuItem(title: 'Address', onTap: () {}),
              ProfileMenuItem(title: 'Eat with Friends', onTap: () {}),
              ProfileMenuItem(title: 'Subscribe & Save', onTap: () {}),
              ProfileMenuItem(title: 'Premium', onTap: () {}),
              ProfileMenuItem(title: 'Help Desk', onTap: () {}),
              ProfileMenuItem(title: 'Feedback', onTap: () {}),
              ProfileMenuItem(title: 'Log Out', onTap: () {Navigator.pushNamed(context, 'login');}),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({Key? key, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}

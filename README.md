# SNACKIT - Food Delivery Application

A Flutter-based food delivery application with Firebase backend integration, featuring user authentication, profile management, and real-time data persistence. [1](#0-0) 

## Features

- **User Authentication**: Email/password registration and login, phone OTP verification [2](#0-1) 
- **Profile Management**: Create, read, and update user profiles stored in Firestore [3](#0-2) 
- **Reactive State Management**: Automatic screen navigation based on authentication status
- **Real-time Data**: Cloud Firestore integration for persistent user data

## Tech Stack

- **Framework**: Flutter
- **State Management**: GetX
- **Backend**: Firebase
  - Firebase Core for initialization [4](#0-3) 
  - Firebase Auth for authentication [5](#0-4) 
  - Cloud Firestore for database [6](#0-5) 
- **Local Storage**: Shared Preferences [7](#0-6) 

## Project Structure

```
lib/
├── main.dart                          # App entry point & Firebase initialization
├── authentication/
│   └── models/
│       └── user_model.dart           # User data model with serialization
├── repository/
│   ├── authentication_repository/    # Auth operations (email, phone OTP)
│   └── user_repository/              # Firestore CRUD operations
├── profile/
│   └── user.dart                     # Profile management UI
└── Bot/
    └── chatBot.dart                  # Chat functionality
```

## Setup Instructions

### Prerequisites
- Flutter SDK
- Firebase project with Auth and Firestore enabled
- Platform-specific Firebase configuration files

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```
3. Configure Firebase:
   - Add `firebase_options.dart` with your project configuration
   - Add platform-specific config files (GoogleService-Info.plist for iOS, google-services.json for Android)
4. Run the app:
   ```bash
   flutter run
   ```

## Architecture

### Firebase Initialization Flow
The app initializes Firebase services before UI rendering using the following sequence: [1](#0-0) 

1. `WidgetsFlutterBinding.ensureInitialized()` - Flutter engine binding
2. `Firebase.initializeApp()` - Firebase core initialization with platform options
3. `Get.put(AuthenticationRepository())` - Dependency injection for auth repository
4. `runApp(GetMaterialApp)` - App launch

### Authentication Flow
The `AuthenticationRepository` manages user sessions through: [2](#0-1) 

- **Email/Password**: `createUserWithEmailAndPassword()` and `loginWithEmailAndPassword()`
- **Phone OTP**: `phoneAuthentication()` triggers OTP, `verifyOTP()` completes sign-in
- **Session Management**: Reactive stream via `authStateChanges()` for automatic screen navigation

### Data Persistence
User data is managed through `UserRepository` using Cloud Firestore: [8](#0-7) 

- **Create**: `createUser()` - Stores user profile with auto-generated document ID
- **Read**: `getUserDetails()` - Fetches user by email, `allUsers()` - Retrieves all users
- **Update**: `updateUserRecord()` - Updates existing user documents


### Citations

**File:** lib/repository/user_repository/user_repository.dart (L13-60)
```dart
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
```

**File:** pubspec.lock (L44-51)
```text
  cloud_firestore:
    dependency: "direct main"
    description:
      name: cloud_firestore
      sha256: bdc7607e9169ee3ce736bbbe6a81c2a6cb15c41379346b74f77f8e641211a17f
      url: "https://pub.dev"
    source: hosted
    version: "5.4.4"
```

**File:** pubspec.lock (L156-163)
```text
  firebase_auth:
    dependency: "direct main"
    description:
      name: firebase_auth
      sha256: d453acec0d958ba0e25d41a9901b32cb77d1535766903dea7a61b2788c304596
      url: "https://pub.dev"
    source: hosted
    version: "5.3.1"
```

**File:** pubspec.lock (L180-187)
```text
  firebase_core:
    dependency: "direct main"
    description:
      name: firebase_core
      sha256: "51dfe2fbf3a984787a2e7b8592f2f05c986bfedd6fdacea3f9e0a7beb334de96"
      url: "https://pub.dev"
    source: hosted
    version: "3.6.0"
```

**File:** pubspec.lock (L443-450)
```text
  shared_preferences:
    dependency: "direct main"
    description:
      name: shared_preferences
      sha256: "95f9997ca1fb9799d494d0cb2a780fd7be075818d59f00c43832ed112b158a82"
      url: "https://pub.dev"
    source: hosted
    version: "2.3.3"
```

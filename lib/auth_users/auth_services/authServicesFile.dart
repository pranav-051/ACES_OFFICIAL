import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Register method to create a new user
  Future<String?> register({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      // Creating a new user with email and password
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // Save user details in Firestore
      await _firestore.collection("users").doc(userCredential.user!.uid).set({
        'name': name.trim(),
        'email': email.trim(),
        'role': role,
      });

      return null; // Return null if registration is successful
    } catch (e) {
      return e.toString(); // Return the error message if registration fails
    }
  }

  // Login method to authenticate a user
  Future<String?> login({
    required String email,
    required String password,
  }) async {
    try {
      // Sign in the user with email and password
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      // Fetch user role from Firestore to determine access level
      DocumentSnapshot userDoc = await _firestore
          .collection("users")
          .doc(userCredential.user!.uid)
          .get();

      // Return the user's role (admin or user)
      return userDoc['role'];
    } catch (e) {
      return e.toString(); // Return the error message if login fails
    }
  }

  // Method to sign out the user
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

import 'package:aces/auth_users/auth_services/authServicesFile.dart';
import 'package:aces/auth_users/registerPage.dart';
import 'package:aces/components/button.dart';
import 'package:aces/userHome/bottomNavBar/mainBottomNav.dart';
import 'package:flutter/material.dart';
import 'package:aces/adminHome/admin_bottom_nav.dart';
import 'package:aces/components/textField.dart';
import 'package:aces/components/passwordField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool isLoading = false; // To show loading spinner during login
  bool isPasswordHidden = true;

  void login() async {
    setState(() {
      isLoading = true;
    });

    // Call login method from AuthService with user inputs
    String? result = await _authService.login(
      email: emailController.text,
      password: passwordController.text,
    );

    setState(() {
      isLoading = false;
    });

    // Navigate based on the role or show the error message
    if (result == "Admin") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const admin_bottom_nav(title: 'Admin Pages',)
        ),
      );

    } else if (result == "User") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          //builder: (_) => const UserScreenA(),
        builder: (_) => const mainBottomNav(title: "Page1")
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Login Failed! $result"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          child: ListView(
            children: [
              // Adding some space at the top
              const SizedBox(height: 100),

              // App logo or image
              Image.asset(
                "assets/acesLogo1.png",
                width: 300,
                height: 300,
              ),
              const SizedBox(height: 40),

              // Email TextField
              CustomTextField(
                controller: emailController,
                hintText: "Enter your email",
                labelText: "Email",
                icon: Icons.email,
              ),

              const SizedBox(height: 20),

              // Password input field

              CustomPasswordField(
                controller: passwordController,
                hintText: "Enter your password",
                labelText: "Password",
                icon: Icons.lock,
              ),

              const SizedBox(height: 20),

              // Login Button or Loading Spinner
              isLoading ? const Center(
                child: CircularProgressIndicator(),
              ) : SizedBox(
                width: double.infinity,
                child: CustomButton(
                  onPressed: login, // Pass the login function
                  text: "Login Now", // Button text
                ),
              ),
              const SizedBox(height: 30),

              // Row with 'Don't have an account?' message
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const RegisterScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Signup here",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

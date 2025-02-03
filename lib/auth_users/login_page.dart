import 'package:flutter/material.dart';
import 'package:aces/auth_users/auth_services/authServicesFile.dart';
import 'package:aces/auth_users/register_page.dart';
import 'package:aces/components/custom_button.dart';
import 'package:aces/constants/colors.dart';
import 'package:aces/userHome/bottomNavBar/mainBottomNav.dart';
import 'package:aces/components/textField.dart';
import 'package:aces/components/passwordField.dart';
import '../adminHome/adminPage.dart';
import 'package:aces/constants/AppImages.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  bool isLoading = false;

  void login() async {
    setState(() => isLoading = true);

    String? result = await _authService.login(
      email: emailController.text,
      password: passwordController.text,
    );

    setState(() => isLoading = false);

    if (result == "Admin") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const adminPage(title: 'Admin Pages')),
      );
    } else if (result == "User") {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const mainBottomNav(title: "User Page")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Failed! $result")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 340,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Image.asset(AppImages.acesLogo1 , height: 180),
                const SizedBox(height: 20),

                // Email Input Field
                CustomTextField(
                  controller: emailController,
                  hintText: "Enter your email",
                  labelText: "Email",
                  icon: Icons.email,
                ),
                const SizedBox(height: 20),

                // Password Input Field
                CustomPasswordField(
                  controller: passwordController,
                  hintText: "Enter your password",
                  labelText: "Password",
                  icon: Icons.lock,
                ),
                const SizedBox(height: 30),

                // Login Button with loading indicator
                isLoading
                    ? const CircularProgressIndicator()
                    : CustomButton(
                  onPressed: login,
                  text: "Login Now",
                  width: double.infinity,
                  textColor: Colors.white,
                  backgroundColor: AppColors.scarletRed,
                ),
                const SizedBox(height: 20),

                const Text(
                  "or sign-up using",
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
                ),
                const SizedBox(height: 20),

                // Social Login Buttons
                Container(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                        icon: Image.asset(AppImages.google),
                        iconSize: 5,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset(AppImages.facebook),
                        iconSize: 35,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset(AppImages.microsoft),
                        iconSize: 35,
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Image.asset(AppImages.tweeter),
                        iconSize: 35,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Signup Redirection
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const RegisterScreen()),
                        );
                      },
                      child: Text(
                        "Signup here",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.roseRedColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
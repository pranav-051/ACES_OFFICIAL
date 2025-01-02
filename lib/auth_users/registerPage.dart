import 'package:aces/auth_users/auth_services/authServicesFile.dart';
import 'package:aces/auth_users/loginPage.dart';
import 'package:aces/components/button.dart';
import 'package:flutter/material.dart';
import 'package:aces/components/textField.dart';
import 'package:aces/components/passwordField.dart';
import 'package:aces/constants/colors.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  bool isPasswordHidden = true;
  String? errorMessage;
  String selectedRole = "User"; // Default selected role for dropdown
  bool isLoading = false;

  final AuthService _authService = AuthService(); // Instance for auth service

  void _signup() async {
    // Signup function for handling user registration
    setState(() {
      isLoading = true;
    });

    // Call signup method from authService with user inputs
    String? result = await _authService.register(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      role: selectedRole,
    );

    setState(() {
      isLoading = false;
    });

    if (result == null) {
      // Signup successful: navigate to loginScreen with success message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("SignUp Successful! Login Now!!"),
        ),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("SignUp Failed! Register Again!! $result"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              // Logo/Image at the top
              Center(
                child: Image.asset(
                  "assets/acesLogo1.png",
                  width: 150,
                  height: 150,
                ),
              ),
              const SizedBox(height: 30),

              // Name input field
              CustomTextField(
                controller: nameController,
                hintText: "Enter your full name",
                labelText: "Full Name*",
                icon: Icons.person,
              ),

              const SizedBox(height: 20),
              CustomTextField(
                controller: emailController,
                hintText: "Enter your email",
                labelText: "Email",
                icon: Icons.email,
              ),

              // Email input field
              const SizedBox(height: 20),


              CustomTextField(
                controller: TextEditingController(),
                hintText: "Enter your CRN",
                labelText: "CRN",
                icon: Icons.perm_identity_rounded,
              ),
              const SizedBox(height: 20),

              CustomTextField(
                controller: TextEditingController(),
                hintText: "Enter your department",
                labelText: "Department",
                icon: Icons.local_fire_department,
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: TextEditingController(),
                hintText: "Enter your college name",
                labelText: "College Name",
                icon: Icons.email,
              ),
              const SizedBox(height: 20),

              CustomPasswordField(
                controller: passwordController,
                hintText: "Enter your password",
                labelText: "Password*",
                icon: Icons.lock,
              ),

              const SizedBox(height: 20),
              // Password input field
              CustomPasswordField(
                controller: passwordController,
                hintText: "Enter your password",
                labelText: "Password*",
                icon: Icons.lock,
              ),
              const SizedBox(height: 20),

              // Dropdown for Role selection
              DropdownButtonFormField<String>(
                value: selectedRole,
                decoration: const InputDecoration(
                  labelText: "Role*",
                  labelStyle: TextStyle(color: Colors.black), // Label text color
                  hintText: "Select your role",
                  hintStyle: TextStyle(color: AppColors.gray), // Hint text color
                  filled: true,
                  fillColor: AppColors.lightGray, // Background color
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black), // Border color
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black), // Enabled border color
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black), // Focused border color
                  ),
                ),
                items: ["Admin", "User"].map((role) {
                  return DropdownMenuItem(
                    value: role,
                    child: Text(
                      role,
                      style: const TextStyle(color: AppColors.oxfordBlue), // Text color inside dropdown
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedRole = newValue!;
                  });
                },
              ),

              const SizedBox(height: 30),

              // Signup button
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SizedBox(
                width: double.infinity,
                child: CustomButton(
                  onPressed: _signup, // Pass the login function
                  text: "Register Now", // Button text
                ),
              ),
              const SizedBox(height: 10),

              // Already have an account? Register here
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already have an account? ",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      "Login here",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.oxfordBlue,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50,),
            ],
          ),
        ),
      ),
    );
  }
}

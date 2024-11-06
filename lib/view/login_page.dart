import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/auth controller.dart';
import '../widget/button.dart';
import '../widget/text_field.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Login',
            style: GoogleFonts.poppins(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.deepPurple,
              Colors.indigo,
              Colors.blueAccent,
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFieldInput(
                  controller: emailController,
                  hintText: 'Email',
                  icon: Icons.email,
                  fillColor: Colors.white.withOpacity(0.1), // Background color of text field
                  textColor: Colors.white, // Text color
                  hintColor: Colors.white.withOpacity(0.7), // Hint color
                  iconColor: Colors.white, // Icon color
                ),
                SizedBox(height: 16),
                TextFieldInput(
                  controller: passwordController,
                  hintText: 'Password',
                  icon: Icons.lock,
                  obscureText: true,
                  fillColor: Colors.white.withOpacity(0.1),
                  textColor: Colors.white,
                  hintColor: Colors.white.withOpacity(0.7),
                  iconColor: Colors.white,
                ),
                SizedBox(height: 24),
                MyButton(
                  text: 'Login',
                  onPressed: () => authController.loginUser(
                    emailController.text.trim(),
                    passwordController.text.trim(),
                  ),
                ),
                TextButton(
                  onPressed: () => Get.to(() => RegisterPage()),
                  child: Text(
                    "Don't have an account? Sign Up",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

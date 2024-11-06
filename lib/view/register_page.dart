import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/auth controller.dart';
import '../widget/button.dart';
import '../widget/text_field.dart';

class RegisterPage extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Register',
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
                  controller: nameController,
                  hintText: 'Name',
                  icon: Icons.person,
                  fillColor: Colors.white.withOpacity(0.1), // TextField background
                  textColor: Colors.white, // Text color
                  hintColor: Colors.white.withOpacity(0.7), // Hint color
                  iconColor: Colors.white, // Icon color
                ),
                SizedBox(height: 16),
                TextFieldInput(
                  controller: emailController,
                  hintText: 'Email',
                  icon: Icons.email,
                  fillColor: Colors.white.withOpacity(0.1),
                  textColor: Colors.white,
                  hintColor: Colors.white.withOpacity(0.7),
                  iconColor: Colors.white,
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
                  text: 'Sign Up',
                  onPressed: () => authController.registerUser(
                    nameController.text.trim(),
                    emailController.text.trim(),
                    passwordController.text.trim(),
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

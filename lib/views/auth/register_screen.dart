import 'package:balenciaga_ecommerce/services/auth_services.dart';
import 'package:balenciaga_ecommerce/utils/consts.dart';
import 'package:balenciaga_ecommerce/utils/validators.dart';
import 'package:balenciaga_ecommerce/views/auth/components/auth_button.dart';
import 'package:balenciaga_ecommerce/views/auth/components/auth_form_field.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 60),
            Text(
              "Register",
              style: TextStyle(
                color: textColor,
                fontSize: 32,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Please create an account to continue",
              style: TextStyle(
                fontSize: 16,
                color: textColor,
              ),
            ),
            SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthFormField(
                    controller: _nameController,
                    label: "Full Name",
                    hintText: "Enter your full name",
                    validator: Validators.validateFullName,
                  ),
                  SizedBox(height: 20),
                  AuthFormField(
                    controller: _emailController,
                    label: "Email",
                    hintText: "Enter your email",
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.validateEmail,
                  ),
                  SizedBox(height: 20),
                  AuthFormField(
                    controller: _passwordController,
                    label: "Password",
                    hintText: "Enter your password",
                    obscureText: true,
                    suffixIcon: Icon(Icons.visibility),
                    validator: Validators.validatePassword,
                  ),
                  SizedBox(height: 20),
                  AuthFormField(
                    controller: _confirmPasswordController,
                    label: "Confirm Password",
                    hintText: "Confirm your password",
                    obscureText: true,
                    suffixIcon: Icon(Icons.visibility),
                    validator: (value) => Validators.validateConfirmPassword(
                      value,
                      _passwordController.text
                    ),
                  ),
                  SizedBox(height: 50),
                 AuthButton(
                    text: "sign up", 
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // ada try catch buat integrasi Register screen
                         try {
                        final user = await AuthServices().signUpWithEmail(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
                        _nameController.text.trim(),
                      );
                      if (user != null) {
                        Navigator.pushReplacementNamed(context, '/catalogue');
                      }
                         }catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())),
                          );
                         }
                      }
                    }, 
                    backgroundColor: primaryColor,
                    textColor: Colors.white,
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",
                      style: TextStyle(
                        color: textColor
                      ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushNamed(context, '/login'),
                        child: Text("Sign in"),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


import 'package:balenciaga_ecommerce/services/auth_services.dart';
import 'package:balenciaga_ecommerce/utils/consts.dart';
import 'package:balenciaga_ecommerce/utils/validators.dart';
import 'package:balenciaga_ecommerce/views/auth/components/auth_button.dart';
import 'package:balenciaga_ecommerce/views/auth/components/auth_form_field.dart';
import 'package:balenciaga_ecommerce/views/auth/components/social_auth_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  // fungsinya untuk memanggil sebuah validator dari setiap form
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 70),
            Text(
              "Welcome Back",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: textColor
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Please enter a form to login to this app",
              style: TextStyle(
                fontSize: 16,
                color: textColor
              ),
            ),
            SizedBox(height: 60),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthFormField(
                    controller: _emailController,
                    label: "Email",
                    hintText: "Enter your Email",
                    validator: Validators.validateEmail,
                  ),
                  SizedBox(height: 20),
                  AuthFormField(
                    controller: _passwordController,
                    label: "Password",
                    hintText: "Enter your Password",
                    obscureText: true,
                    suffixIcon: Icon(Icons.visibility_off),
                    validator: Validators.validatePassword,
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {}, 
                      child: Text("forgot Password?")
                      ),
                  ),
                  SizedBox(height: 20),
                  AuthButton(
                    text: "sign in", 
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // ada try catch buat integrasi loginScreen
                         try {
                        final user = await AuthServices().signInWithEmail(
                        _emailController.text.trim(),
                        _passwordController.text.trim(),
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
                    textColor: Colors.white, 
                    backgroundColor: primaryColor
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: textColor,
                          )
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "or",
                            style: TextStyle(
                              color: textColor
                              ),
                            ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            color: textColor,
                          )
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    SocialAuthButton(
                      assetIcon: "assets/icons/google_logo.svg", 
                      label: "Sign in with Google", 
                      backgroundColor: Colors.white, 
                      foregroundColor: Colors.black,
                      onPressed: () {},
                      ),
                      SizedBox(height: 20),
                      SocialAuthButton(
                      assetIcon: "assets/icons/apple_logo.svg", 
                      label: "Sign in with Apple", 
                      backgroundColor: Colors.black, 
                      foregroundColor: Colors.white,
                      onPressed: () {},
                      ),
                      SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Dont have an acc?",
                          style: TextStyle(
                            color: textColor,
                          ),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pushNamed(context, '/register'),
                            child: Text("Register"),
                          )
                        ],
                      )       
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
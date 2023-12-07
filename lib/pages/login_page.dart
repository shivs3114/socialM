import 'package:flutter/material.dart';
import 'package:social2/components/my_button.dart';
import 'package:social2/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void login() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                Icon(
                  Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                const SizedBox(height: 25),
                Text(
                  "PRO Planet",
                  style: TextStyle(fontSize: 20),
                ),
                MyTextField(
                  hintText: "abc@gmail.com",
                  obscureText: false,
                  controller: emailController,
                ),
                const SizedBox(
                  height: 10,
                ),
                MyTextField(
                  hintText: "Password",
                  obscureText: true,
                  controller: passwordController,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Forgot Password',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary),
                    )
                  ],
                ),
                const SizedBox(height: 25),
                MyButton(
                  text: "Login",
                  onTap: login,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    GestureDetector(
                        onTap: onTap,
                        child: const Text("Register here",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

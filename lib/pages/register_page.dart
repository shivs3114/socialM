import 'package:auth/auth.dart';
import 'package:flutter/material.dart';
import 'package:social2/components/my_button.dart';
import 'package:social2/components/my_textfield.dart';
import 'package:social2/helper//helper_function.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController userController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPwController = TextEditingController();

  void registerUser() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );
    if (passwordController.text != confirmPwController.text) {
      Navigator.pop(context);
      displayMessagerToUser("Password didn't match", context);
    }
    try {
      UserCredential? userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
    } on FirebaseException catch (e) {
      Navigator.pop(context);
      displayMessagerToUser(e.code, context);
    }
  }

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
                  hintText: 'Username',
                  obscureText: false,
                  controller: userController,
                ),
                const SizedBox(
                  height: 10,
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
                MyTextField(
                    hintText: 'Confirm Password',
                    obscureText: true,
                    controller: confirmPwController),
                const SizedBox(
                  height: 10,
                ),
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
                  text: "Register",
                  onTap: registerUser,
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary),
                    ),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: const Text("Login here",
                            style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}

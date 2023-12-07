import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:social2/auth/login_or_auth.dart';
import 'package:social2/pages/register_page.dart';
import 'package:social2/theme/dark_mode.dart';
import 'package:social2/theme/light_mode.dart';
import 'package:social2/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginOrRegister(),
      theme: lightMode,
      darkTheme: darkMode,
    );
  }
}

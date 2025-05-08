import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_shopping_assistant/screens/signupNlogin/firstscreen.dart';
import 'package:smart_shopping_assistant/screens/homescreen.dart';
import 'package:smart_shopping_assistant/screens/signupNlogin/loginscreen.dart';
import 'package:smart_shopping_assistant/screens/signupNlogin/signinscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/welcome': (context) => const signinscreen(),
        '/home': (context) => const homepage(),
        '/login': (context) => const Loginscreen(),
        '/first': (context) => const firstscreen(),
      },
      home: user != null ? const homepage() : const firstscreen(),
      // Performance optimizations
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ScrollBehavior().copyWith(
            physics: const BouncingScrollPhysics(),
          ),
          child: child!,
        );
      },
    );
  }
}

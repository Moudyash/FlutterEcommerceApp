import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mohammed/view/auth/login.dart';
import 'package:mohammed/view/auth/signup.dart';
import 'package:mohammed/view/auth/splash.dart';
import 'package:mohammed/view/cart.dart';
import 'package:mohammed/view/home.dart';

import 'AboutAppScreen.dart';

bool? isLogin;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    isLogin = true;
  } else {
    isLogin = false;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Splash(),
      routes: {
        "/login": (context) => LogIn(),
        "/signup": (context) => SignUp(),
        "/home": (context) => Home(),
        "/cart": (context) => Cart(),
        "/about": (context) => AboutScreen(),

      },
    );
  }
}

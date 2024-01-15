import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/pages/home.dart';
import 'package:firebase_test/pages/login.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Home();
        } else {
          return Login();
        }
      },
    ));
  }
}

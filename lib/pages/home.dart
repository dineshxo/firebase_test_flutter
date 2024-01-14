import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

void SignOut() {
  FirebaseAuth.instance.signOut();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
        actions: const [
          IconButton(
            onPressed: SignOut,
            icon: Icon(Icons.logout),
          )
        ],
      ),
    );
  }
}

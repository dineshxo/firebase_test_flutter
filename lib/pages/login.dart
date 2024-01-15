import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_test/components/btn.dart';
import 'package:firebase_test/components/icon_tile.dart';
import 'package:firebase_test/components/constraints.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

final TextEditingController userNameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Icon(
                Icons.lock,
                size: 100,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                'Welcome Back ! You\'ve been missed.',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              TextField(
                  controller: userNameController,
                  obscureText: false,
                  decoration: kInputDecoration.copyWith(
                    hintText: "User Name",
                  )),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: kInputDecoration.copyWith(
                  hintText: "Password",
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Forgot Password'),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Button(
                title: 'Sign In',
                onTap: () {
                  SignUserIn();
                  print('pressed');
                },
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('or Sign in with'),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconTile(
                    imagePath: 'assets/apple.png',
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconTile(imagePath: 'assets/google.png')
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not a Member,'),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Register Now!',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blue),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }

  void SignUserIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userNameController.text, password: passwordController.text);
    } on FirebaseAuthException catch (err) {
      if (err.code == 'invalid-credential') {
        print('User Name or Password is incorrect!');
      } else {
        print(err.toString());
      }
    }

    Navigator.pop(context);
  }
}

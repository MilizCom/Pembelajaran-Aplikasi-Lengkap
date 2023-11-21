import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email = TextEditingController();
  final password = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InputWidget("Email", email),
            SizedBox(height: 30),
            InputWidget("Password", password, isPassword: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _registerUser();
              },
              child: Text("Register"),
            ),
            ElevatedButton(
              onPressed: () async {
                await _signInUser();
              },
              child: Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _registerUser() async {
    try {
      if (email.text.isEmpty || password.text.isEmpty) {
        // Perform validation
        // You may want to show a snackbar or an alert dialog to inform the user
        return;
      }

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      // User registration successful
      print("User registered: ${userCredential.user?.email}");
    } catch (e) {
      // Handle any errors that occur during the user registration process
      print("Error during registration: $e");
      // You can also show an error message to the user
    }
  }

  Future<void> _signInUser() async {
    try {
      if (email.text.isEmpty || password.text.isEmpty) {
        // Perform validation
        // You may want to show a snackbar or an alert dialog to inform the user
        return;
      }

      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );

      // User sign-in successful
      print("User signed in: ${userCredential.user?.email}");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      } else {
        print("Error during sign-in: $e");
      }
    }
  }

  TextField InputWidget(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return TextField(
      decoration: InputDecoration(
        hintText: label,
      ),
      controller: controller,
      obscureText: isPassword,
    );
  }
}

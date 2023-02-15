import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mhs_app/screens/login_screen.dart';

import 'home_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //  user login
          if (snapshot.hasData) {
            return HomeScreen();
          }
          // user not login
          else {
            return LogInScreen();
          }
        },
      ),
    );
  }
}

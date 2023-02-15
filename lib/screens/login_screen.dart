import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
import '../components/button.dart';
import '../components/password_textfield.dart';
import '../components/username_textfield.dart';
import '../components/square_tile.dart';
import '/constants.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => LogIneScreenState();
}

class LogIneScreenState extends State<LogInScreen> {
  bool showPassword = false;

  // text editing controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user up method
  void signUserUp() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size ukuran = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF5FFC6),
      body: Stack(children: [
        Container(
          width: ukuran.width,
          height: ukuran.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // logo
                const Icon(
                  Icons.person,
                  size: 100,
                ),

                const Text(
                  'Let\'s get started!',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 50),

                // email textfield
                UsernameTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),

                const SizedBox(height: 20),

                // password textfield
                PasswordTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  // obscureText: true,
                ),

                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                // sign btton
                MyButton(
                  onTap: signUserUp,
                ),
                const SizedBox(height: 25),

                // or continue with
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding25),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: padding10),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                // google sign up
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [SquareTile(imagePath: 'assets/google.png')],
                ),
                // new mwmber?
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'New member? ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Register now.',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

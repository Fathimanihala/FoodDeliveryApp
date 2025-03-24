import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/services/auth/authservice.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class MyRegisterPage extends StatefulWidget {
  final void Function()? onTap;

  MyRegisterPage({super.key, required this.onTap});

  @override
  State<MyRegisterPage> createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController conformpasswordcontroller =
      TextEditingController();

  void register() async {
    final _authService = AuthService();
    if (passwordcontroller.text == conformpasswordcontroller.text) {
      try {
        await _authService.signUpWithEmailPassword(
            emailcontroller.text, passwordcontroller.text);
      } catch (e) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(e.toString()),
                ));
      }
    } else {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('passwords no match'),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_clock_rounded,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Lets create an account for you",
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            SizedBox(
              height: 25,
            ),
            MyTextfield(
                controller: emailcontroller,
                hintText: "Email",
                obscureText: false),
            SizedBox(
              height: 25,
            ),
            MyTextfield(
                controller: passwordcontroller,
                hintText: "Password",
                obscureText: true),
            SizedBox(
              height: 25,
            ),
            MyTextfield(
                controller: conformpasswordcontroller,
                hintText: "conformPassword",
                obscureText: true),
            SizedBox(
              height: 25,
            ),
            MyButton(
              text: "Sign Up",
              onTap:  register,
            ),
            SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                SizedBox(
                  width: 4,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

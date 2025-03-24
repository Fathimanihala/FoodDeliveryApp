import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/login_page.dart';
import 'package:fooddeliveryapp/pages/register_page.dart';

class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {

  bool showLohinPage = true;

  void togglePages() {
    setState(() {
      showLohinPage = !showLohinPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLohinPage) {
      return LoginPage(onTap: togglePages);
    } else {
      return MyRegisterPage(onTap: togglePages);
    }
  }
}
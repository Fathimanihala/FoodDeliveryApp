import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/pages/home_page.dart';
import 'package:fooddeliveryapp/services/auth/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder:(context,snapshot){
            // user is login
            if(snapshot.hasData){
              return HomePage();
            }
              // USER NOT LOGGED IN
              else{
                return LoginOrRegister();
            }
          }),
    );
  }
}

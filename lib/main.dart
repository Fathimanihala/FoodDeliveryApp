import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:fooddeliveryapp/firebase_options.dart';
import 'package:fooddeliveryapp/model/Restaurant.dart';
import 'package:fooddeliveryapp/pages/login_page.dart';
import 'package:fooddeliveryapp/pages/register_page.dart';
import 'package:fooddeliveryapp/services/auth/auth_gate.dart';
import 'package:fooddeliveryapp/services/auth/login_or_register.dart';
import 'package:fooddeliveryapp/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:
  DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => Restaurant(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: Provider.of<ThemeProvider>(context).themeData,
        home: AuthGate());
  }
}

// This trailing comma makes auto-formatting nicer for build methods.

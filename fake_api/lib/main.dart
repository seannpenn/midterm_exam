import 'package:fake_api/service_locators.dart';
import 'package:flutter/material.dart';

import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
  setupLocators();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fake Store',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

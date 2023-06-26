import 'package:authentication/authentication/login_or_register_page.dart';
import 'package:authentication/authentication/provider_type_select.dart';
import 'package:authentication/home/all_parts_integrated.dart';
import 'package:authentication/home/main_application_page.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      //debugShowCheckedModeBanner: false,
      home: LoginOrRegisterPage(),
    );
  }
}

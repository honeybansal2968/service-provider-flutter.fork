import 'package:ServiceProviderApp/Login_Screen/login.dart';
import 'package:ServiceProviderApp/drawer_screens/drawer_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return DrawerScreen();
        } else {
          return MyLogin();
        }
      },
    ));
  }
}

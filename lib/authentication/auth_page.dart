// import 'package:authentication/authentication/login_or_register_page.dart';
// import 'package:flutter/material.dart';
// import 'homepage.dart';

// class AuthPage extends StatelessWidget {
//   const AuthPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: StreamBuilder(
//             stream: FirebaseAuth.instance.authStateChanges(),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return HomePage(); //user logged in
//               }
//               return LoginOrRegisterPage(); //user not logged in
//             }));
//   }
// }

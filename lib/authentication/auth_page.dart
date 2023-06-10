// import 'package:authentication/authentication/provider_type_select.dart';
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
//               return ProviderTogglePage(); //user not logged in,this page will take his identity for further uses and direct him to login/signup
//             }));
//   }
// }

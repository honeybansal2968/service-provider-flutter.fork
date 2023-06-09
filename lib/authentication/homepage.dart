import 'package:authentication/models/userModel.dart';
import 'package:authentication/serivces/auth_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final User user;
  const HomePage({super.key, required this.user});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 12,
            ),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(widget.user.photo),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(widget.user.fullName),
            const SizedBox(
              height: 12,
            ),
            Text(widget.user.email),
            const SizedBox(
              height: 12,
            ),
            Text(widget.user.role),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
                onPressed: () async {
                  await AuthService.logOut();
                  if (context.mounted) {
                    Navigator.pop(context);
                  }
                },
                child: const Text("Log Out"))
          ],
        ),
      )),
    );
  }
}

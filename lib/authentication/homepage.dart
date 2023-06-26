import 'package:authentication/models/userModel.dart';
import 'package:authentication/serivces/auth_service.dart';
import 'package:flutter/material.dart';
//this page was used for testing the login success as a landing page.
// the code is still kept because it shows the login info which is yet to be integrated into the main appplication

class HomePage2 extends StatefulWidget {
  final User user;
  const HomePage2({super.key, required this.user});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
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
